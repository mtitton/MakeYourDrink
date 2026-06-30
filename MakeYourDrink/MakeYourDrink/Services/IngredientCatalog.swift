//
//  IngredientCatalog.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 30/06/26.
//

import Foundation

enum IngredientCatalog {
    static func ingredient(named name: String) -> Ingredient? {
        let normalizedName = normalize(name)

        return MockData.ingredients.first { ingredient in
            normalize(ingredient.name) == normalizedName ||
            ingredient.searchAliases.map(normalize).contains(normalizedName)
        }
    }

    static func category(for ingredientName: String) -> IngredientCategory {
        ingredient(named: ingredientName)?.category ?? .others
    }

    private static func normalize(_ value: String) -> String {
        value
            .folding(options: .diacriticInsensitive, locale: .current)
            .lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
