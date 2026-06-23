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
}

enum ShoppingListService {
    static func suggestions(
        matches: [DrinkMatch]
    ) -> [ShoppingSuggestion] {
        let missingIngredients = matches
            .filter { $0.matchPercentage < 100 }
            .flatMap { $0.missingIngredients }

        let grouped = Dictionary(grouping: missingIngredients, by: { $0 })

        return grouped
            .map {
                ShoppingSuggestion(
                    ingredientName: $0.key,
                    unlockCount: $0.value.count
                )
            }
            .sorted { $0.unlockCount > $1.unlockCount }
    }
}
