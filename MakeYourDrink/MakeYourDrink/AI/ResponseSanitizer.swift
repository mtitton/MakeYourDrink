//
//  ResponseSanitizer.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import Foundation

enum ResponseSanitizer {
    static func clean(
        _ suggestion: AIBartenderSuggestion,
        prompt: String,
        userIngredients: [Ingredient]
    ) -> AIBartenderSuggestion {
        let canUseMissingIngredients = allowsMissingIngredients(from: prompt)

        let allowedCatalogNames = Set(
            MockData.ingredients.map {
                normalize($0.name)
            }
        )

        let userIngredientNames = Set(
            userIngredients.map {
                normalize($0.name)
            }
        )

        let cleanedIngredients = suggestion.ingredients
            .filter { ingredient in
                let name = normalize(ingredient.name)

                guard allowedCatalogNames.contains(name) else {
                    return false
                }

                if !canUseMissingIngredients {
                    return userIngredientNames.contains(name)
                }

                return true
            }
            .map {
                sanitizeIngredient($0)
            }

        let finalIngredients = cleanedIngredients.isEmpty
            ? fallbackIngredients(prompt: prompt, userIngredients: userIngredients)
            : cleanedIngredients

        let finalName = CocktailNamingService.bestName(
            aiName: suggestion.name,
            ingredients: finalIngredients
        )

        return AIBartenderSuggestion(
            name: finalName,
            description: suggestion.description,
            ingredients: finalIngredients,
            instructions: suggestion.instructions
        )
    }

    private static func sanitizeIngredient(
        _ ingredient: DrinkIngredient
    ) -> DrinkIngredient {
        let name = normalize(ingredient.name)

        if name.contains("gelo") {
            return DrinkIngredient(
                name: ingredient.name,
                amount: 1,
                unit: .piece
            )
        }

        if ingredient.unit == .leaf {
            return DrinkIngredient(
                name: ingredient.name,
                amount: min(max(ingredient.amount, 4), 12),
                unit: .leaf
            )
        }

        if ingredient.unit == .ml {
            let isSpirit = [
                "gin",
                "vodka",
                "rum",
                "whisky",
                "tequila",
                "cachaca"
            ].contains(name)

            let amount = isSpirit
                ? min(max(ingredient.amount, 35), 80)
                : min(max(ingredient.amount, 50), 200)

            return DrinkIngredient(
                name: ingredient.name,
                amount: amount,
                unit: .ml
            )
        }

        return DrinkIngredient(
            name: ingredient.name,
            amount: min(max(ingredient.amount, 1), 6),
            unit: ingredient.unit
        )
    }

    private static func fallbackIngredients(
        prompt: String,
        userIngredients: [Ingredient]
    ) -> [DrinkIngredient] {
        let base = requiredBase(from: prompt)
            ?? userIngredients.first(where: { $0.category == .spirits })?.name
            ?? "Gin"

        return [
            DrinkIngredient(name: base, amount: 50, unit: .ml),
            DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
            DrinkIngredient(name: "Água Tônica", amount: 120, unit: .ml),
            DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
        ]
    }

    private static func requiredBase(from prompt: String) -> String? {
        let text = normalize(prompt)

        if text.contains("vodka") { return "Vodka" }
        if text.contains("gin") { return "Gin" }
        if text.contains("rum") { return "Rum" }
        if text.contains("whisky") { return "Whisky" }
        if text.contains("tequila") { return "Tequila" }
        if text.contains("cachaca") { return "Cachaça" }

        return nil
    }

    private static func allowsMissingIngredients(from prompt: String) -> Bool {
        let text = normalize(prompt)

        if text.contains("pode usar ingredientes que o usuario nao possui: nao") {
            return false
        }

        return true
    }

    private static func normalize(_ value: String) -> String {
        value
            .lowercased()
            .folding(options: .diacriticInsensitive, locale: .current)
    }
}
