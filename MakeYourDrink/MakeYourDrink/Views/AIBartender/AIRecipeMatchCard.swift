//
//  AIRecipeMatchCard.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import SwiftUI

struct AIRecipeMatchCard: View {
    let match: AIRecipeMatch

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Match com seu bar")
                        .font(.headline)
                        .foregroundStyle(DrinkColors.textPrimary)

                    Text(match.matchPercentage == 100 ? "Você tem tudo" : "Faltam alguns ingredientes")
                        .font(.subheadline)
                        .foregroundStyle(DrinkColors.textSecondary)
                }

                Spacer()

                Text("\(match.matchPercentage)%")
                    .font(.largeTitle.bold())
                    .foregroundStyle(DrinkColors.accent)
            }

            ProgressView(value: Double(match.matchPercentage), total: 100)
                .tint(DrinkColors.accent)

            if !match.availableIngredients.isEmpty {
                ingredientList(
                    title: "Você possui",
                    icon: "checkmark.circle.fill",
                    color: DrinkColors.success,
                    ingredients: match.availableIngredients
                )
            }

            if !match.missingIngredients.isEmpty {
                ingredientList(
                    title: "Falta comprar",
                    icon: "xmark.circle.fill",
                    color: DrinkColors.danger,
                    ingredients: match.missingIngredients
                )
            }
        }
        .padding(18)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private func ingredientList(
        title: String,
        icon: String,
        color: Color,
        ingredients: [DrinkIngredient]
    ) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundStyle(DrinkColors.textPrimary)

            ForEach(ingredients) { ingredient in
                HStack {
                    Image(systemName: icon)
                        .foregroundStyle(color)

                    Text(ingredient.name)
                        .foregroundStyle(DrinkColors.textSecondary)

                    Spacer()
                }
            }
        }
    }
}
