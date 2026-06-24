//
//  SavedAIDrinkDetailView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct SavedAIDrinkDetailView: View {

    let suggestion: AIBartenderSuggestion

    var body: some View {

        ScrollView(showsIndicators: false) {

            VStack(
                alignment: .leading,
                spacing: 24
            ) {

                header

                ingredientsSection

                instructionsSection
            }
            .padding(20)
        }
        .background(
            DrinkColors.background
        )
        .navigationTitle(
            suggestion.name
        )
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {

        VStack(
            alignment: .leading,
            spacing: 10
        ) {

            Text(suggestion.name)
                .font(.largeTitle.bold())
                .foregroundStyle(
                    DrinkColors.textPrimary
                )

            Text(
                suggestion.description
            )
            .foregroundStyle(
                DrinkColors.textSecondary
            )
        }
    }

    private var ingredientsSection: some View {

        VStack(
            alignment: .leading,
            spacing: 12
        ) {

            Text("Ingredientes")
                .font(.title3.bold())

            ForEach(
                suggestion.ingredients
            ) { ingredient in

                Text(
                    "\(formattedAmount(ingredient.amount)) \(ingredient.unit.rawValue) \(ingredient.name)"
                )
            }
        }
    }

    private var instructionsSection: some View {

        VStack(
            alignment: .leading,
            spacing: 12
        ) {

            Text("Modo de preparo")
                .font(.title3.bold())

            ForEach(
                Array(
                    suggestion.instructions.enumerated()
                ),
                id: \.offset
            ) { index, step in

                Text(
                    "\(index + 1). \(step)"
                )
            }
        }
    }

    private func formattedAmount(
        _ value: Double
    ) -> String {

        if value.truncatingRemainder(
            dividingBy: 1
        ) == 0 {
            return String(Int(value))
        }

        return String(
            format: "%.1f",
            value
        )
    }
}
