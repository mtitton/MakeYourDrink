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
    @State private var recipeMatch: AIRecipeMatch?
    @State private var recipeVersions: [AIRecipeVersion] = []
    @State private var selectedVersionIndex = 0
    @State private var evolvingOption: AIRecipeEvolution?
    @State private var loadingMessageIndex = 0

    private let loadingMessages = [
        "Analisando seu bar...",
        "Equilibrando sabores...",
        "Criando uma receita autoral...",
        "Validando ingredientes...",
        "Finalizando seu drink..."
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                DrinkColors.background
                    .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        FadeInView(delay: 0.00) {
                            header
                        }

                        FadeInView(delay: 0.05) {
                            wizardCard
                        }

                        FadeInView(delay: 0.10) {
                            input
                        }

                        FadeInView(delay: 0.15) {
                            createButton
                        }

                        if isLoading {
                            FadeInView(delay: 0.00) {
                                aiLoadingView
                            }
                        }

                        if let currentSuggestion {
                            FadeInView(delay: 0.10) {
                                suggestionCard(currentSuggestion)
                            }
                        }
                    }
                    .padding(20)
                }
            }
            .navigationTitle("IA Bartender")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Crie um drink único")
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Use o Drink Wizard ou descreva livremente o que você quer beber.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    private var wizardCard: some View {
        NavigationLink {
            DrinkWizardView { generatedPrompt in
                prompt = generatedPrompt
                createDrink()
            }
        } label: {
            PremiumCard {
                HStack(spacing: 14) {
                    Image(systemName: "wand.and.stars")
                        .font(.title2)
                        .foregroundStyle(DrinkColors.accent)
                        .symbolEffect(.pulse)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Usar Drink Wizard")
                            .font(.headline)
                            .foregroundStyle(DrinkColors.textPrimary)

                        Text("Responda algumas perguntas e deixe a IA montar a receita ideal.")
                            .font(.subheadline)
                            .foregroundStyle(DrinkColors.textSecondary)
                    }

                    Spacer()

                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundStyle(DrinkColors.textSecondary)
                }
            }
        }
        .buttonStyle(PremiumButtonStyle())
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
            .padding(14)
            .background(DrinkColors.card)
            .overlay {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .strokeBorder(
                        isPromptFocused ? DrinkColors.accent.opacity(0.65) : Color.white.opacity(0.05),
                        lineWidth: isPromptFocused ? 1.5 : 1
                    )
            }
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .animation(.spring(response: 0.28, dampingFraction: 0.8), value: isPromptFocused)
            .overlay(alignment: .topLeading) {
                if prompt.isEmpty {
                    Text("Ex: quero algo cítrico, leve e refrescante com gin")
                        .font(.subheadline)
                        .foregroundStyle(DrinkColors.textSecondary)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 22)
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
                .background(
                    prompt.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                    ? DrinkColors.textSecondary
                    : DrinkColors.accent
                )
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        .disabled(prompt.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isLoading)
        .buttonStyle(PremiumButtonStyle())
    }

    private func suggestionCard(_ suggestion: AIBartenderSuggestion) -> some View {
        PremiumCard {
            VStack(alignment: .leading, spacing: 18) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(suggestion.name)
                        .font(.title.bold())
                        .foregroundStyle(DrinkColors.textPrimary)

                    Text(suggestion.description)
                        .font(.subheadline)
                        .foregroundStyle(DrinkColors.textSecondary)
                }

                if let currentMatch {
                    FadeInView(delay: 0.05) {
                        AIRecipeMatchCard(match: currentMatch)
                    }
                }

                FadeInView(delay: 0.10) {
                    RecipeMetadataCard(
                        metadata: RecipeMetadataBuilder.build(for: suggestion)
                    )
                }

                versionControl

                FadeInView(delay: 0.15) {
                    evolutionSection
                }

                FadeInView(delay: 0.20) {
                    chatButton(for: suggestion)
                }

                ingredientsSection(for: suggestion)

                instructionsSection(for: suggestion)

                saveButton(for: suggestion)
            }
        }
        .scaleOnAppear()
    }

    private func ingredientsSection(
        for suggestion: AIBartenderSuggestion
    ) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Ingredientes")
                .font(.headline)
                .foregroundStyle(DrinkColors.textPrimary)

            VStack(spacing: 8) {
                ForEach(suggestion.ingredients) { ingredient in
                    HStack {
                        Text("\(formattedAmount(ingredient.amount)) \(ingredient.unit.rawValue)")
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(DrinkColors.accent)
                            .frame(width: 72, alignment: .leading)

                        Text(ingredient.name)
                            .foregroundStyle(DrinkColors.textSecondary)

                        Spacer()
                    }
                    .padding(12)
                    .background(DrinkColors.cardSecondary)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                }
            }
        }
    }

    private func instructionsSection(
        for suggestion: AIBartenderSuggestion
    ) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Preparo")
                .font(.headline)
                .foregroundStyle(DrinkColors.textPrimary)

            VStack(spacing: 10) {
                ForEach(Array(suggestion.instructions.enumerated()), id: \.offset) { index, step in
                    HStack(alignment: .top, spacing: 12) {
                        Text("\(index + 1)")
                            .font(.caption.bold())
                            .foregroundStyle(.black)
                            .frame(width: 28, height: 28)
                            .background(DrinkColors.accent)
                            .clipShape(Circle())

                        Text(step)
                            .foregroundStyle(DrinkColors.textSecondary)
                            .lineSpacing(3)

                        Spacer()
                    }
                    .padding(12)
                    .background(DrinkColors.cardSecondary)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                }
            }
        }
    }

    private func saveButton(
        for suggestion: AIBartenderSuggestion
    ) -> some View {
        Button {
            appState.saveAISuggestion(suggestion)
            HapticService.success()
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
        .buttonStyle(PremiumButtonStyle())
    }

    private func createDrink() {
        isPromptFocused = false
        suggestion = nil
        recipeMatch = nil
        isLoading = true

        startLoadingMessages()

        Task {
            let appleResult = await AppleAIBartenderService.createSuggestion(
                prompt: prompt,
                userIngredients: appState.userIngredients,
                preferences: appState.preferences,
                appState: appState
            )

            let finalResult: AIBartenderSuggestion

            if let appleResult {
                finalResult = appleResult
            } else {
                finalResult = await AIBartenderService.createSuggestion(
                    prompt: prompt,
                    userIngredients: appState.userIngredients,
                    preferences: appState.preferences
                )
            }

            await MainActor.run {
                let recipeMatch = AIRecipeMatcher.match(
                    suggestion: finalResult,
                    userIngredients: appState.userIngredients
                )

                let version = AIRecipeVersion(
                    suggestion: finalResult,
                    match: recipeMatch
                )

                recipeVersions = [version]
                selectedVersionIndex = 0
                suggestion = finalResult
                self.recipeMatch = recipeMatch
                isLoading = false
            }
        }
    }

    private func formattedAmount(_ value: Double) -> String {
        value.truncatingRemainder(dividingBy: 1) == 0
            ? String(Int(value))
            : String(format: "%.1f", value)
    }

    private var selectedVersion: AIRecipeVersion? {
        guard recipeVersions.indices.contains(selectedVersionIndex) else {
            return nil
        }

        return recipeVersions[selectedVersionIndex]
    }

    private var currentSuggestion: AIBartenderSuggestion? {
        selectedVersion?.suggestion
    }

    private var currentMatch: AIRecipeMatch? {
        selectedVersion?.match
    }

    private var versionControl: some View {
        Group {
            if recipeVersions.count > 1 {
                HStack {
                    Button {
                        if selectedVersionIndex > 0 {
                            selectedVersionIndex -= 1
                            HapticService.light()
                        }
                    } label: {
                        Image(systemName: "chevron.left.circle.fill")
                    }
                    .disabled(selectedVersionIndex == 0)
                    .buttonStyle(PremiumButtonStyle())

                    Spacer()

                    Text("Receita \(selectedVersionIndex + 1) de \(recipeVersions.count)")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(DrinkColors.textSecondary)

                    Spacer()

                    Button {
                        if selectedVersionIndex < recipeVersions.count - 1 {
                            selectedVersionIndex += 1
                            HapticService.light()
                        }
                    } label: {
                        Image(systemName: "chevron.right.circle.fill")
                    }
                    .disabled(selectedVersionIndex == recipeVersions.count - 1)
                    .buttonStyle(PremiumButtonStyle())
                }
                .font(.title3)
                .foregroundStyle(DrinkColors.accent)
            }
        }
    }

    private var evolutionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("✨ Evoluir receita")
                .font(.headline)
                .foregroundStyle(DrinkColors.textPrimary)

            FlowLayout(spacing: 10) {
                ForEach(AIRecipeEvolution.allCases) { option in
                    Button {
                        evolveRecipe(option)
                    } label: {
                        Text("\(option.emoji) \(option.title)")
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(.black)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(DrinkColors.accent)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(PremiumButtonStyle())
                    .disabled(isLoading)
                }
            }

            if let evolvingOption {
                Text("Reinventando: \(evolvingOption.emoji) \(evolvingOption.title)...")
                    .font(.caption)
                    .foregroundStyle(DrinkColors.textSecondary)
            }
        }
    }

    private func evolveRecipe(_ option: AIRecipeEvolution) {
        guard let currentSuggestion else { return }

        isLoading = true
        startLoadingMessages()

        evolvingOption = option

        Task {
            let evolved = await AppleAIBartenderService.evolveRecipe(
                currentSuggestion: currentSuggestion,
                evolution: option,
                appState: appState
            )

            await MainActor.run {
                if let evolved {
                    let recipeMatch = AIRecipeMatcher.match(
                        suggestion: evolved,
                        userIngredients: appState.userIngredients
                    )

                    let version = AIRecipeVersion(
                        suggestion: evolved,
                        match: recipeMatch,
                        evolution: option
                    )

                    recipeVersions.append(version)
                    selectedVersionIndex = recipeVersions.count - 1
                    suggestion = evolved
                    self.recipeMatch = recipeMatch
                    HapticService.success()
                }

                evolvingOption = nil
                isLoading = false
            }
        }
    }

    private func chatButton(
        for suggestion: AIBartenderSuggestion
    ) -> some View {
        NavigationLink {
            DrinkChatView(suggestion: suggestion)
        } label: {
            HStack(spacing: 14) {
                Image(systemName: "bubble.left.and.bubble.right.fill")
                    .font(.title3)
                    .foregroundStyle(DrinkColors.accent)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Perguntar ao Bartender")
                        .font(.headline)
                        .foregroundStyle(DrinkColors.textPrimary)

                    Text("Tire dúvidas sobre substituições, preparo e variações.")
                        .font(.caption)
                        .foregroundStyle(DrinkColors.textSecondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(DrinkColors.textSecondary)
            }
            .padding(16)
            .background(DrinkColors.cardSecondary)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
        .buttonStyle(PremiumButtonStyle())
    }

    private var aiLoadingView: some View {
        PremiumCard {
            HStack(spacing: 14) {
                ProgressView()
                    .tint(DrinkColors.accent)

                VStack(alignment: .leading, spacing: 4) {
                    Text(loadingMessages[loadingMessageIndex])
                        .font(.headline)
                        .foregroundStyle(DrinkColors.textPrimary)

                    Text("O Bartender está preparando algo especial.")
                        .font(.caption)
                        .foregroundStyle(DrinkColors.textSecondary)
                }

                Spacer()
            }
        }
        .scaleOnAppear()
    }

    private func startLoadingMessages() {
        loadingMessageIndex = 0

        Task {
            while isLoading {
                try? await Task.sleep(nanoseconds: 900_000_000)

                await MainActor.run {
                    guard isLoading else { return }

                    loadingMessageIndex = (loadingMessageIndex + 1) % loadingMessages.count
                }
            }
        }
    }
}
