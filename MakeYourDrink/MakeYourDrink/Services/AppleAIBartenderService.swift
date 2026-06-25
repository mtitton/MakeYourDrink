//
//  AppleAIBartenderService.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import Foundation
import FoundationModels

enum AppleAIBartenderService {
    static func createSuggestion(
        prompt: String,
        userIngredients: [Ingredient],
        preferences: UserPreferences
    ) async -> AIBartenderSuggestion? {
        let finalPrompt = buildPrompt(
            prompt: prompt,
            userIngredients: userIngredients,
            preferences: preferences
        )

        do {
            let session = LanguageModelSession(
                instructions: """
                Você é um bartender profissional.
                Crie receitas realistas, seguras e fáceis de preparar.
                Nunca invente ingredientes fora da lista permitida.
                O nome do drink deve refletir os ingredientes usados.
                """
            )

            let response = try await session.respond(
                generating: AppleAIDrinkRecipe.self
            ) {
                Prompt(finalPrompt)
            }

            let suggestion = response.content.toSuggestion()

            return sanitizeSuggestion(
                suggestion,
                prompt: prompt,
                userIngredients: userIngredients
            )
        } catch {
            print("Apple AI structured generation error:", error)
            return nil
        }
    }

    private static func buildPrompt(
        prompt: String,
        userIngredients: [Ingredient],
        preferences: UserPreferences
    ) -> String {
        let userIngredientNames = userIngredients
            .map { $0.name }
            .joined(separator: ", ")

        let allowedIngredients = MockData.ingredients
            .map { $0.name }
            .joined(separator: ", ")

        let favoriteBases = preferences.favoriteBases
            .joined(separator: ", ")

        let favoriteFlavors = preferences.favoriteFlavors
            .joined(separator: ", ")

        return """
        Crie UMA receita de drink baseada no pedido abaixo.

        Pedido:
        \(prompt)

        Ingredientes que o usuário possui:
        \(userIngredientNames.isEmpty ? "Nenhum ingrediente cadastrado" : userIngredientNames)

        Ingredientes permitidos no aplicativo:
        \(allowedIngredients)

        Preferências do usuário:
        Bases favoritas: \(favoriteBases.isEmpty ? "Não definido" : favoriteBases)
        Sabores favoritos: \(favoriteFlavors.isEmpty ? "Não definido" : favoriteFlavors)
        Teor alcoólico preferido: \(preferences.preferredAlcoholLevel.rawValue)

        REGRAS OBRIGATÓRIAS:
        - Use SOMENTE ingredientes da lista "Ingredientes permitidos no aplicativo".
        - Se o usuário pediu uma base alcoólica específica, ela deve ser o ingrediente principal.
        - Se o usuário pediu Vodka, não use Gin.
        - Se o usuário pediu Gin, não use Vodka.
        - Se o usuário pediu Rum, não use Gin, Vodka ou Whisky como base.
        - Se "Pode usar ingredientes que o usuário não possui" for "Não", use SOMENTE ingredientes que o usuário possui.
        - Não invente frutas, xaropes ou ingredientes que não estejam na lista permitida.
        - O nome do drink deve mencionar apenas ingredientes realmente usados.
        - Não use "Apple", "Berry", "Orange", "Tropical", "Passion", "Pineapple" ou similares se o ingrediente correspondente não estiver na receita.
        - Gelo deve ser sempre 1 un.
        - Destilados devem ter entre 35 ml e 80 ml.
        - Mixers, sucos e água tônica devem ter entre 50 ml e 200 ml.
        - Hortelã deve ter entre 4 e 12 folhas.
        - Crie uma receita realista de bar.
        - As instruções devem ser curtas e práticas.
        """
    }

    private static func sanitizeSuggestion(
        _ suggestion: AIBartenderSuggestion,
        prompt: String,
        userIngredients: [Ingredient]
    ) -> AIBartenderSuggestion {
        let canUseMissingIngredients = allowsMissingIngredients(from: prompt)

        let allowedCatalogNames = Set(
            MockData.ingredients.map {
                normalized($0.name)
            }
        )

        let userIngredientNames = Set(
            userIngredients.map {
                normalized($0.name)
            }
        )

        let sanitizedIngredients = suggestion.ingredients
            .filter { ingredient in
                let name = normalized(ingredient.name)

                if !allowedCatalogNames.contains(name) {
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

        let finalIngredients = sanitizedIngredients.isEmpty
            ? fallbackIngredients(
                prompt: prompt,
                userIngredients: userIngredients
            )
            : sanitizedIngredients

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
        let normalizedName = normalized(ingredient.name)

        if normalizedName.contains("gelo") {
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
                "cachaca",
                "cachaça"
            ].contains(normalizedName)

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

    private static func sanitizedName(
        _ name: String,
        ingredients: [DrinkIngredient]
    ) -> String {
        let ingredientNames = ingredients
            .map { normalized($0.name) }

        let invalidWords: [String: String] = [
            "apple": "maçã",
            "maca": "maçã",
            "maçã": "maçã",
            "berry": "frutas vermelhas",
            "orange": "laranja",
            "laranja": "laranja",
            "pineapple": "abacaxi",
            "abacaxi": "abacaxi",
            "passion": "maracujá",
            "maracuja": "maracujá",
            "maracujá": "maracujá"
        ]

        for word in invalidWords.keys {
            if normalized(name).contains(word) &&
                !ingredientNames.contains(where: { $0.contains(word) }) {
                return fallbackName(from: ingredients)
            }
        }

        return name
    }

    private static func fallbackName(
        from ingredients: [DrinkIngredient]
    ) -> String {
        let base = ingredients.first {
            ["gin", "vodka", "rum", "whisky", "tequila", "cachaca", "cachaça"]
                .contains(normalized($0.name))
        }?.name ?? "Drink"

        let fruit = ingredients.first {
            !["gin", "vodka", "rum", "whisky", "tequila", "cachaca", "cachaça", "gelo"]
                .contains(normalized($0.name))
        }?.name

        if let fruit {
            return "\(base) com \(fruit)"
        }

        return "\(base) Especial"
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

    private static func requiredBase(
        from prompt: String
    ) -> String? {
        let normalizedPrompt = normalized(prompt)

        if normalizedPrompt.contains("vodka") {
            return "Vodka"
        }

        if normalizedPrompt.contains("gin") {
            return "Gin"
        }

        if normalizedPrompt.contains("rum") {
            return "Rum"
        }

        if normalizedPrompt.contains("whisky") {
            return "Whisky"
        }

        if normalizedPrompt.contains("tequila") {
            return "Tequila"
        }

        if normalizedPrompt.contains("cachaca") ||
            normalizedPrompt.contains("cachaça") {
            return "Cachaça"
        }

        return nil
    }

    private static func normalized(_ value: String) -> String {
        value
            .lowercased()
            .folding(options: .diacriticInsensitive, locale: .current)
    }
    
    private static func allowsMissingIngredients(from prompt: String) -> Bool {
        let normalizedPrompt = normalized(prompt)

        if normalizedPrompt.contains("pode usar ingredientes que o usuario nao possui: nao") {
            return false
        }

        return true
    }
}

@Generable
struct AppleAIDrinkRecipe {
    @Guide(description: "Nome curto e atrativo do drink, usando apenas ingredientes presentes na receita.")
    let name: String

    @Guide(description: "Descrição curta do drink em português.")
    let description: String

    @Guide(description: "Lista de ingredientes permitidos, com quantidades realistas.")
    let ingredients: [AppleAIIngredient]

    @Guide(description: "Passos curtos e práticos de preparo.")
    let instructions: [String]

    func toSuggestion() -> AIBartenderSuggestion {
        AIBartenderSuggestion(
            name: name,
            description: description,
            ingredients: ingredients.map {
                DrinkIngredient(
                    name: $0.name,
                    amount: $0.amount,
                    unit: $0.unit.toDrinkUnit()
                )
            },
            instructions: instructions
        )
    }
}

@Generable
struct AppleAIIngredient {
    @Guide(description: "Nome do ingrediente. Deve existir na lista de ingredientes permitidos.")
    let name: String

    @Guide(description: "Quantidade numérica realista.")
    let amount: Double

    @Guide(description: "Unidade do ingrediente.")
    let unit: AppleAIIngredientUnit
}

@Generable
enum AppleAIIngredientUnit {
    case ml
    case piece
    case leaf

    func toDrinkUnit() -> DrinkUnit {
        switch self {
        case .ml:
            return .ml
        case .piece:
            return .piece
        case .leaf:
            return .leaf
        }
    }
}
