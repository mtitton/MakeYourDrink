//
//  IngredientCatalogValidator.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 30/06/26.
//

import Foundation

enum IngredientCatalogValidator {

    static func validate() {
        var catalogNames = Set<String>()

        MockData.ingredients.forEach { ingredient in
            catalogNames.insert(normalize(ingredient.name))

            ingredient.searchAliases.forEach { alias in
                catalogNames.insert(normalize(alias))
            }
        }

        let usedIngredients = Set(
            MockData.drinks.flatMap { drink in
                drink.ingredients.map { $0.name }
            }
        )

        let missing = usedIngredients
            .filter {
                !catalogNames.contains(normalize($0))
            }
            .sorted()

        if missing.isEmpty {
            print("✅ Todos os ingredientes dos drinks existem no catálogo.")
        } else {
            print("⚠️ Ingredientes faltando no MockData.ingredients:")
            missing.forEach {
                print("- \($0)")
            }
        }
    }

    private static func normalize(_ value: String) -> String {
        value
            .folding(options: .diacriticInsensitive, locale: .current)
            .lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
