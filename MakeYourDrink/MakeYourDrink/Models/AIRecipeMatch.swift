//
//  AIRecipeMatch.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import Foundation

struct AIRecipeMatch {
    let suggestion: AIBartenderSuggestion
    let availableIngredients: [DrinkIngredient]
    let missingIngredients: [DrinkIngredient]

    var matchPercentage: Int {
        guard !suggestion.ingredients.isEmpty else { return 0 }

        return Int(
            Double(availableIngredients.count) /
            Double(suggestion.ingredients.count) * 100
        )
    }
}
