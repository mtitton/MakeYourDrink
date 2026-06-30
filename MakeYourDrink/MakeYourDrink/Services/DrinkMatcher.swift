//
//  DrinkMatcher.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

struct DrinkMatch: Identifiable {
    let id = UUID()
    let drink: Drink
    let matchPercentage: Int
    let availableIngredients: [String]
    let missingIngredients: [String]
}

final class DrinkMatcher {
    static func match(
        drinks: [Drink],
        userIngredients: [Ingredient]
    ) -> [DrinkMatch] {

        drinks.map { drink in
            var available: [String] = []
            var missing: [String] = []

            for ingredient in drink.ingredients {
                let hasIngredient = IngredientMatcher.matches(
                    requiredName: ingredient.name,
                    userIngredients: userIngredients
                )

                if hasIngredient {
                    available.append(ingredient.name)
                } else {
                    missing.append(ingredient.name)
                }
            }

            let total = drink.ingredients.count

            let percentage = total == 0
                ? 0
                : Int((Double(available.count) / Double(total)) * 100)

            return DrinkMatch(
                drink: drink,
                matchPercentage: percentage,
                availableIngredients: available,
                missingIngredients: missing
            )
        }
        .sorted {
            if $0.matchPercentage == $1.matchPercentage {
                return $0.drink.name < $1.drink.name
            }

            return $0.matchPercentage > $1.matchPercentage
        }
    }
}
