//
//  TextIngredientInputView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct TextIngredientInputView: View {

    @EnvironmentObject private var appState: AppState

    @State private var text = ""

    var body: some View {
        ZStack {

            DrinkColors.background
                .ignoresSafeArea()

            VStack(spacing: 20) {

                TextEditor(text: $text)
                    .scrollContentBackground(.hidden)
                    .background(DrinkColors.card)
                    .foregroundStyle(DrinkColors.textPrimary)
                    .frame(height: 250)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 24,
                            style: .continuous
                        )
                    )

                Button {
                    importIngredients()
                } label: {
                    Text("Adicionar Ingredientes")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(DrinkColors.accent)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 16,
                                style: .continuous
                            )
                        )
                }

                Spacer()
            }
            .padding(20)
        }
        .navigationTitle("Escrever")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func importIngredients() {

        let lines = text
            .components(separatedBy: .newlines)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }

        for line in lines {

            if let ingredient = MockData.ingredients.first(
                where: {
                    $0.name.lowercased() == line.lowercased()
                }
            ) {
                if !appState.userIngredients.contains(ingredient) {
                    appState.userIngredients.append(ingredient)
                }
            }
        }
    }
}
