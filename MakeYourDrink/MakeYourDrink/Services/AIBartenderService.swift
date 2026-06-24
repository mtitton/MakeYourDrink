//
//  AIBartenderService.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import Foundation

enum AIBartenderService {
    static func createSuggestion(
        prompt: String,
        userIngredients: [Ingredient],
        preferences: UserPreferences
    ) async -> AIBartenderSuggestion {
        try? await Task.sleep(nanoseconds: 1_000_000_000)

        let base = preferences.favoriteBases.first ?? userIngredients.first?.name ?? "Gin"

        return AIBartenderSuggestion(
            name: "Golden House",
            description: "Um drink personalizado criado com base no que você tem em casa.",
            ingredients: [
                DrinkIngredient(name: base, amount: 50, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo em um copo alto.",
                "Coloque \(base) e limão.",
                "Complete com água com gás.",
                "Misture suavemente e sirva."
            ]
        )
    }
}
