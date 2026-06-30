//
//  IngredientMatcher.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 30/06/26.
//

import Foundation

enum IngredientMatcher {

    static func matches(
        requiredName: String,
        userIngredients: [Ingredient],
        allIngredients: [Ingredient] = MockData.ingredients
    ) -> Bool {

        let required = normalize(requiredName)

        for userIngredient in userIngredients {
            let userName = normalize(userIngredient.name)

            if userName == required {
                return true
            }

            if let catalogIngredient = allIngredients.first(where: {
                normalize($0.name) == userName
            }) {
                let aliases = catalogIngredient.searchAliases.map {
                    normalize($0)
                }

                if aliases.contains(required) {
                    return true
                }
            }
        }

        return false
    }

    private static func normalize(_ value: String) -> String {
        value
            .folding(options: .diacriticInsensitive, locale: .current)
            .lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
