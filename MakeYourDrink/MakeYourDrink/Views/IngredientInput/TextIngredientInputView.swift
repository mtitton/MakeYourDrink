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
                
                Text("Exemplo: Tenho gin, limão, vodka e água tônica")
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
                    .frame(maxWidth: .infinity, alignment: .leading)

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

        let ingredients = IngredientParser.parse(
            text: text,
            availableIngredients: MockData.ingredients
        )

        for ingredient in ingredients {

            if !appState.userIngredients.contains(ingredient) {
                appState.userIngredients.append(ingredient)
            }
        }

        text = ""
    }
}
