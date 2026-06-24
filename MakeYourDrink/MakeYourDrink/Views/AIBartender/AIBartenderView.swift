//
//  AIBartenderView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct AIBartenderView: View {
    @FocusState private var isPromptFocused: Bool
    @EnvironmentObject private var appState: AppState

    @State private var prompt = ""
    @State private var isLoading = false
    @State private var suggestion: AIBartenderSuggestion?

    var body: some View {
        ZStack {
            DrinkColors.background.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    header
                    input
                    createButton

                    if isLoading {
                        ProgressView("Criando drink...")
                            .tint(DrinkColors.accent)
                            .foregroundStyle(DrinkColors.textPrimary)
                    }

                    if let suggestion {
                        suggestionCard(suggestion)
                    }
                }
                .padding(20)
            }
        }
        .navigationTitle("AI Bartender")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Crie um drink único")
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Diga o que você quer beber e o bartender inteligente cria uma sugestão.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    private var input: some View {
        TextEditor(text: $prompt)
            .focused($isPromptFocused)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("OK") {
                        isPromptFocused = false
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .foregroundStyle(DrinkColors.textPrimary)
            .frame(height: 170)
            .padding(12)
            .background(DrinkColors.card)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .overlay(alignment: .topLeading) {
                if prompt.isEmpty {
                    Text("Ex: quero algo cítrico, leve e refrescante com gin")
                        .font(.subheadline)
                        .foregroundStyle(DrinkColors.textSecondary)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 20)
                        .allowsHitTesting(false)
                }
            }
    }

    private var createButton: some View {
        Button {
            createDrink()
        } label: {
            Text("Criar Drink")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(prompt.isEmpty ? DrinkColors.textSecondary : DrinkColors.accent)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        .disabled(prompt.isEmpty || isLoading)
    }

    private func suggestionCard(_ suggestion: AIBartenderSuggestion) -> some View {
        VStack(alignment: .leading, spacing: 18) {
            Text(suggestion.name)
                .font(.title.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text(suggestion.description)
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)

            VStack(alignment: .leading, spacing: 10) {
                Text("Ingredientes")
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)

                ForEach(suggestion.ingredients) { ingredient in
                    Text("\(formattedAmount(ingredient.amount)) \(ingredient.unit.rawValue) \(ingredient.name)")
                        .foregroundStyle(DrinkColors.textSecondary)
                }
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("Preparo")
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)

                ForEach(Array(suggestion.instructions.enumerated()), id: \.offset) { index, step in
                    Text("\(index + 1). \(step)")
                        .foregroundStyle(DrinkColors.textSecondary)
                }
            }
            
            Button {
                appState.saveAISuggestion(suggestion)
            } label: {
                Text(appState.isAISuggestionSaved(suggestion) ? "Drink salvo" : "Salvar Drink")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(DrinkColors.accent)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            .disabled(appState.isAISuggestionSaved(suggestion))
        }
        .padding(20)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
    }

    private func createDrink() {
        isPromptFocused = false
        isLoading = true
        suggestion = nil

        Task {
            let result = await AIBartenderService.createSuggestion(
                prompt: prompt,
                userIngredients: appState.userIngredients,
                preferences: appState.preferences
            )

            await MainActor.run {
                suggestion = result
                isLoading = false
            }
        }
    }

    private func formattedAmount(_ value: Double) -> String {
        value.truncatingRemainder(dividingBy: 1) == 0
            ? String(Int(value))
            : String(format: "%.1f", value)
    }
}
