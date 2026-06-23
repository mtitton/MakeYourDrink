//
//  IngredientParser.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

enum IngredientParser {

    static func parse(
        text: String,
        availableIngredients: [Ingredient]
    ) -> [Ingredient] {

        let normalized = text
            .folding(
                options: .diacriticInsensitive,
                locale: .current
            )
            .lowercased()

        return availableIngredients.filter { ingredient in

            let ingredientName = ingredient.name
                .folding(
                    options: .diacriticInsensitive,
                    locale: .current
                )
                .lowercased()

            return normalized.contains(ingredientName)
        }
    }
}
