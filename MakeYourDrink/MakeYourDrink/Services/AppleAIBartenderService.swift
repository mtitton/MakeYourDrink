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
            let session = LanguageModelSession()
            let response = try await session.respond(to: finalPrompt)
            let content = String(describing: response.content)

            return parseSuggestion(from: content)
        } catch {
            print("Apple AI error:", error)
            return nil
        }
    }

    private static func buildPrompt(
        prompt: String,
        userIngredients: [Ingredient],
        preferences: UserPreferences
    ) -> String {
        let ingredients = userIngredients.map { $0.name }.joined(separator: ", ")
        let favoriteBases = preferences.favoriteBases.joined(separator: ", ")
        let favoriteFlavors = preferences.favoriteFlavors.joined(separator: ", ")

        return """
        Você é um bartender especialista.

        Crie uma receita de drink baseada no pedido abaixo.

        Pedido do usuário:
        \(prompt)

        Ingredientes disponíveis:
        \(ingredients.isEmpty ? "Nenhum ingrediente cadastrado" : ingredients)

        Preferências do usuário:
        Bases favoritas: \(favoriteBases.isEmpty ? "Não definido" : favoriteBases)
        Sabores favoritos: \(favoriteFlavors.isEmpty ? "Não definido" : favoriteFlavors)
        Teor alcoólico preferido: \(preferences.preferredAlcoholLevel.rawValue)

        IMPORTANTE:
        - Respeite a base alcoólica solicitada pelo usuário.
        - Se o usuário pediu Vodka, não use Gin.
        - Se o usuário pediu Gin, não use Vodka.
        - Retorne apenas JSON válido.
        - Não inclua markdown.
        - Não inclua explicações fora do JSON.

        Formato obrigatório:

        {
          "name": "Nome do drink",
          "description": "Descrição curta",
          "ingredients": [
            {
              "name": "Vodka",
              "amount": 50,
              "unit": "ml"
            }
          ],
          "instructions": [
            "Passo 1",
            "Passo 2"
          ]
        }
        """
    }

    private static func parseSuggestion(
        from content: String
    ) -> AIBartenderSuggestion? {
        let cleaned = extractJSON(from: content)

        guard let data = cleaned.data(using: .utf8),
              let dto = try? JSONDecoder().decode(AISuggestionDTO.self, from: data) else {
            print("Failed to parse Apple AI response:", content)
            return nil
        }

        return AIBartenderSuggestion(
            name: dto.name,
            description: dto.description,
            ingredients: dto.ingredients.map {
                DrinkIngredient(
                    name: $0.name,
                    amount: $0.amount,
                    unit: mapUnit($0.unit)
                )
            },
            instructions: dto.instructions
        )
    }

    private static func extractJSON(from text: String) -> String {
        guard let start = text.firstIndex(of: "{"),
              let end = text.lastIndex(of: "}") else {
            return text
        }

        return String(text[start...end])
    }

    private static func mapUnit(_ value: String) -> DrinkUnit {
        let normalized = value.lowercased()

        if normalized.contains("ml") {
            return .ml
        }

        if normalized.contains("folha") {
            return .leaf
        }

        return .piece
    }
}

private struct AISuggestionDTO: Decodable {
    let name: String
    let description: String
    let ingredients: [AIIngredientDTO]
    let instructions: [String]
}

private struct AIIngredientDTO: Decodable {
    let name: String
    let amount: Double
    let unit: String
}
