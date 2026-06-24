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

        let analysis = PromptAnalyzer.analyze(prompt)

        let base = analysis.preferredBase
            ?? preferences.favoriteBases.first
            ?? userIngredients.first(where: { $0.category == .spirits })?.name
            ?? "Gin"

        let flavor = analysis.flavor ?? .refreshing
        let strength = analysis.strength ?? .medium

        return buildSuggestion(
            base: base,
            flavor: flavor,
            strength: strength
        )
    }

    private static func buildSuggestion(
        base: String,
        flavor: PromptFlavor,
        strength: PromptStrength
    ) -> AIBartenderSuggestion {
        switch flavor {
        case .citrus:
            return citrusDrink(base: base, strength: strength)
        case .sweet:
            return sweetDrink(base: base, strength: strength)
        case .refreshing:
            return refreshingDrink(base: base, strength: strength)
        case .fruity:
            return fruityDrink(base: base, strength: strength)
        case .bitter:
            return bitterDrink(base: base, strength: strength)
        }
    }

    private static func baseAmount(for strength: PromptStrength) -> Double {
        switch strength {
        case .light:
            return 35
        case .medium:
            return 50
        case .strong:
            return 65
        }
    }

    private static func citrusDrink(
        base: String,
        strength: PromptStrength
    ) -> AIBartenderSuggestion {
        AIBartenderSuggestion(
            name: "Citrus \(base)",
            description: "Um drink cítrico criado com \(base), limão e água com gás.",
            ingredients: [
                DrinkIngredient(name: base, amount: baseAmount(for: strength), unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo em um copo alto.",
                "Coloque \(base) e limão.",
                "Complete com água com gás.",
                "Misture suavemente."
            ]
        )
    }

    private static func sweetDrink(
        base: String,
        strength: PromptStrength
    ) -> AIBartenderSuggestion {
        AIBartenderSuggestion(
            name: "Golden Sweet \(base)",
            description: "Um drink doce e equilibrado com toque frutado.",
            ingredients: [
                DrinkIngredient(name: base, amount: baseAmount(for: strength), unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 120, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo em um copo.",
                "Coloque \(base) e suco de laranja.",
                "Adicione grenadine lentamente.",
                "Misture suavemente antes de servir."
            ]
        )
    }

    private static func refreshingDrink(
        base: String,
        strength: PromptStrength
    ) -> AIBartenderSuggestion {
        AIBartenderSuggestion(
            name: "Fresh \(base)",
            description: "Uma opção leve, refrescante e fácil de preparar.",
            ingredients: [
                DrinkIngredient(name: base, amount: baseAmount(for: strength), unit: .ml),
                DrinkIngredient(name: "Hortelã", amount: 6, unit: .leaf),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Água Tônica", amount: 120, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Macere levemente a hortelã com limão.",
                "Adicione gelo e \(base).",
                "Complete com água tônica.",
                "Misture suavemente."
            ]
        )
    }

    private static func fruityDrink(
        base: String,
        strength: PromptStrength
    ) -> AIBartenderSuggestion {
        AIBartenderSuggestion(
            name: "Berry \(base)",
            description: "Um drink frutado e aromático criado para momentos descontraídos.",
            ingredients: [
                DrinkIngredient(name: base, amount: baseAmount(for: strength), unit: .ml),
                DrinkIngredient(name: "Morango", amount: 4, unit: .piece),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Macere os morangos.",
                "Adicione \(base) e gelo.",
                "Complete com água com gás.",
                "Misture suavemente."
            ]
        )
    }

    private static func bitterDrink(
        base: String,
        strength: PromptStrength
    ) -> AIBartenderSuggestion {
        AIBartenderSuggestion(
            name: "Bitter \(base)",
            description: "Um drink mais seco e sofisticado, com perfil amargo.",
            ingredients: [
                DrinkIngredient(name: base, amount: baseAmount(for: strength), unit: .ml),
                DrinkIngredient(name: "Aperol", amount: 40, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 80, unit: .ml),
                DrinkIngredient(name: "Laranja", amount: 1, unit: .piece),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo em uma taça.",
                "Coloque \(base) e Aperol.",
                "Complete com água com gás.",
                "Finalize com laranja."
            ]
        )
    }
}
