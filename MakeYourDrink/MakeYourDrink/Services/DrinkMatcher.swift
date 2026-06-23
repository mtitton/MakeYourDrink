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
        let userIngredientNames = Set(
            userIngredients.map { $0.name.lowercased() }
        )

        return drinks.map { drink in
            let drinkIngredientNames = drink.ingredients.map {
                $0.name.lowercased()
            }

            let available = drink.ingredients
                .filter {
                    userIngredientNames.contains($0.name.lowercased())
                }
                .map { $0.name }

            let missing = drink.ingredients
                .filter {
                    !userIngredientNames.contains($0.name.lowercased())
                }
                .map { $0.name }

            let percentage = drinkIngredientNames.isEmpty
                ? 0
                : Int((Double(available.count) / Double(drinkIngredientNames.count)) * 100)

            return DrinkMatch(
                drink: drink,
                matchPercentage: percentage,
                availableIngredients: available,
                missingIngredients: missing
            )
        }
        .sorted { $0.matchPercentage > $1.matchPercentage }
    }
}
