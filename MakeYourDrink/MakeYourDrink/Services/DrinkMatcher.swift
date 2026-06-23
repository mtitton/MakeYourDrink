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
    static func match(drinks: [Drink], userIngredients: [Ingredient]) -> [DrinkMatch] {
        let userIngredientNames = Set(userIngredients.map { $0.name.lowercased() })

        return drinks.map { drink in
            let drinkIngredients = drink.ingredients.map { $0.lowercased() }

            let available = drink.ingredients.filter {
                userIngredientNames.contains($0.lowercased())
            }

            let missing = drink.ingredients.filter {
                !userIngredientNames.contains($0.lowercased())
            }

            let percentage = drinkIngredients.isEmpty
                ? 0
                : Int((Double(available.count) / Double(drinkIngredients.count)) * 100)

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
