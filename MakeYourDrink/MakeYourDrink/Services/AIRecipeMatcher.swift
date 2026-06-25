//
//  AIRecipeMatcher.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import Foundation

enum AIRecipeMatcher {
    static func match(
        suggestion: AIBartenderSuggestion,
        userIngredients: [Ingredient]
    ) -> AIRecipeMatch {
        let owned = Set(
            userIngredients.map {
                normalize($0.name)
            }
        )

        let available = suggestion.ingredients.filter {
            owned.contains(normalize($0.name))
        }

        let missing = suggestion.ingredients.filter {
            !owned.contains(normalize($0.name))
        }

        return AIRecipeMatch(
            suggestion: suggestion,
            availableIngredients: available,
            missingIngredients: missing
        )
    }

    private static func normalize(_ value: String) -> String {
        value
            .lowercased()
            .folding(options: .diacriticInsensitive, locale: .current)
    }
}
