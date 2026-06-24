//
//  ShoppingListService.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

struct ShoppingSuggestion: Identifiable {
    let id = UUID()
    let ingredientName: String
    let unlockCount: Int
    let affectedMatches: [DrinkMatch]
}

enum ShoppingListService {
    static func suggestions(
        matches: [DrinkMatch]
    ) -> [ShoppingSuggestion] {
        let incompleteMatches = matches.filter {
            $0.matchPercentage < 100
        }

        let missingIngredients = Set(
            incompleteMatches.flatMap { $0.missingIngredients }
        )

        return missingIngredients.map { ingredientName in
            let affectedMatches = incompleteMatches.filter {
                $0.missingIngredients.contains(ingredientName)
            }

            return ShoppingSuggestion(
                ingredientName: ingredientName,
                unlockCount: affectedMatches.count,
                affectedMatches: affectedMatches
            )
        }
        .sorted { $0.unlockCount > $1.unlockCount }
    }
}
