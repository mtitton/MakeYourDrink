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
                Você é um bartender especialista.
                Crie receitas de drinks claras, seguras e fáceis de preparar.
                Respeite obrigatoriamente a base alcoólica solicitada pelo usuário.
                """
            )

            let response = try await session.respond(
                generating: AppleAIDrinkRecipe.self
            ) {
                Prompt(finalPrompt)
            }

            return response.content.toSuggestion()
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
        let ingredients = userIngredients
            .map { $0.name }
            .joined(separator: ", ")

        let favoriteBases = preferences.favoriteBases
            .joined(separator: ", ")

        let favoriteFlavors = preferences.favoriteFlavors
            .joined(separator: ", ")

        return """
        Crie uma receita de drink baseada no pedido abaixo.

        Pedido:
        \(prompt)

        Ingredientes disponíveis no Meu Bar:
        \(ingredients.isEmpty ? "Nenhum ingrediente cadastrado" : ingredients)

        Preferências do usuário:
        Bases favoritas: \(favoriteBases.isEmpty ? "Não definido" : favoriteBases)
        Sabores favoritos: \(favoriteFlavors.isEmpty ? "Não definido" : favoriteFlavors)
        Teor alcoólico preferido: \(preferences.preferredAlcoholLevel.rawValue)

        Regras:
        - Respeite a base alcoólica pedida.
        - Se o usuário pedir Vodka, use Vodka como ingrediente principal.
        - Se o usuário pedir Gin, use Gin como ingrediente principal.
        - Se o usuário pedir Rum, use Rum como ingrediente principal.
        - Se o usuário pedir Whisky, use Whisky como ingrediente principal.
        - Se o usuário pedir Tequila, use Tequila como ingrediente principal.
        - Não substitua a base alcoólica por outra.
        - Crie apenas uma receita.
        - Use quantidades realistas.
        - As instruções devem ser curtas e práticas.
        """
    }
}

@Generable
struct AppleAIDrinkRecipe {
    @Guide(description: "Nome curto e atrativo do drink.")
    let name: String

    @Guide(description: "Descrição curta do drink em português.")
    let description: String

    @Guide(description: "Lista de ingredientes com quantidade e unidade.")
    let ingredients: [AppleAIIngredient]

    @Guide(description: "Passos curtos de preparo.")
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
    @Guide(description: "Nome do ingrediente.")
    let name: String

    @Guide(description: "Quantidade numérica do ingrediente.")
    let amount: Double

    @Guide(description: "Unidade do ingrediente: ml, un ou folhas.")
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
