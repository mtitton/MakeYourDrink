//
//  DrinkChatService.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 26/06/26.
//

import Foundation
import FoundationModels

enum DrinkChatService {
    static func ask(
        question: String,
        suggestion: AIBartenderSuggestion,
        previousMessages: [DrinkChatMessage],
        appState: AppState
    ) async -> String {
        if isNonAlcoholicRequest(question) {
            return nonAlcoholicAnswer(for: suggestion)
        }
        
        let prompt = buildPrompt(
            question: question,
            suggestion: suggestion,
            previousMessages: previousMessages,
            appState: appState
        )

        do {
            let session = LanguageModelSession(
                instructions: """
                Você é um bartender profissional do app Make Your Drink.
                Responda somente sobre a receita atual.
                Seja claro, útil, seguro e direto.
                Responda sempre em português.

                Regras obrigatórias:
                - Nunca contradiga o pedido do usuário.
                - Se o usuário pedir versão sem álcool, remova totalmente bebidas alcoólicas.
                - Em versões sem álcool, nunca sugira gin, vodka, rum, whisky, tequila, cachaça, licor, vinho ou espumante.
                - Para versões sem álcool, use alternativas como água com gás, água tônica, ginger ale, sucos, frutas, chá gelado, xarope simples, hortelã ou gelo.
                - Se sugerir substituição, explique o impacto no sabor.
                - Se calcular para mais pessoas, recalcule as quantidades de forma proporcional.
                - Incentive consumo responsável quando falar de álcool.
                """
            )

            let response = try await session.respond {
                Prompt(prompt)
            }

            return String(describing: response.content)
        } catch {
            print("Drink chat error:", error)
            return "Não consegui responder agora. Tente novamente em alguns instantes."
        }
    }

    private static func buildPrompt(
        question: String,
        suggestion: AIBartenderSuggestion,
        previousMessages: [DrinkChatMessage],
        appState: AppState
    ) -> String {
        let ingredients = suggestion.ingredients
            .map {
                "- \($0.amount) \($0.unit.rawValue) \($0.name)"
            }
            .joined(separator: "\n")

        let instructions = suggestion.instructions
            .enumerated()
            .map {
                "\($0.offset + 1). \($0.element)"
            }
            .joined(separator: "\n")

        let history = previousMessages
            .suffix(8)
            .map {
                "\($0.role == .user ? "Usuário" : "Bartender"): \($0.text)"
            }
            .joined(separator: "\n")

        let userIngredients = appState.userIngredients
            .map { $0.name }
            .joined(separator: ", ")

        return """
        Receita atual:

        Nome:
        \(suggestion.name)

        Descrição:
        \(suggestion.description)

        Ingredientes:
        \(ingredients)

        Preparo:
        \(instructions)

        Ingredientes que o usuário possui:
        \(userIngredients.isEmpty ? "Nenhum ingrediente cadastrado" : userIngredients)

        Histórico recente da conversa:
        \(history.isEmpty ? "Sem histórico ainda" : history)

        Pergunta do usuário:
        \(question)

        Intenção detectada:
        \(detectedIntentRules(for: question))

        Regras:
        - Responda somente considerando essa receita.
        - Não invente ingredientes muito incomuns se houver substituições simples.
        - Seja breve, mas útil.
        """
    }

    private static func detectedIntentRules(
        for question: String
    ) -> String {
        let text = normalize(question)

        if text.contains("sem alcool") ||
            text.contains("sem álcool") ||
            text.contains("mocktail") ||
            text.contains("nao alcoolico") ||
            text.contains("não alcoólico") {

            return """
            O usuário pediu uma versão SEM ÁLCOOL.

            Regras obrigatórias para esta resposta:
            - Remova qualquer bebida alcoólica.
            - Não sugira gin, vodka, rum, whisky, tequila, cachaça, licor, vinho ou espumante.
            - Sugira uma versão mocktail.
            - Use alternativas como água com gás, água tônica, ginger ale, suco, fruta, hortelã, xarope simples ou chá gelado.
            - Explique rapidamente como a substituição muda o sabor.
            """
        }

        if text.contains("mais doce") {
            return """
            O usuário quer deixar o drink mais doce.
            Sugira frutas, sucos, grenadine, xarope simples ou redução da acidez.
            """
        }

        if text.contains("mais forte") {
            return """
            O usuário quer deixar o drink mais forte.
            Sugira aumento moderado do destilado, mantendo consumo responsável.
            """
        }

        if text.contains("mais citrico") ||
            text.contains("mais cítrico") {
            return """
            O usuário quer deixar o drink mais cítrico.
            Sugira limão, laranja ou outro ingrediente cítrico disponível.
            """
        }

        if text.contains("pessoas") ||
            text.contains("pessoa") ||
            text.contains("para 4") ||
            text.contains("para 6") ||
            text.contains("para 8") {
            return """
            O usuário quer adaptar a receita para mais pessoas.
            Recalcule as quantidades proporcionalmente.
            """
        }

        return "Nenhuma intenção especial detectada."
    }

    private static func normalize(_ value: String) -> String {
        value
            .lowercased()
            .folding(options: .diacriticInsensitive, locale: .current)
    }
    
    private static func isNonAlcoholicRequest(_ question: String) -> Bool {
        let text = normalize(question)

        return text.contains("sem alcool") ||
        text.contains("sem álcool") ||
        text.contains("mocktail") ||
        text.contains("nao alcoolico") ||
        text.contains("não alcoólico")
    }

    private static func nonAlcoholicAnswer(
        for suggestion: AIBartenderSuggestion
    ) -> String {
        let alcoholicIngredients = [
            "vodka",
            "gin",
            "rum",
            "whisky",
            "tequila",
            "cachaca",
            "cachaça",
            "licor",
            "vinho",
            "espumante"
        ]

        let base = suggestion.ingredients.first {
            alcoholicIngredients.contains(normalize($0.name))
        }?.name ?? "a base alcoólica"

        return """
        Para fazer uma versão sem álcool, remova \(base).

        Sugestão:
        • substitua por 80 ml de água com gás ou água tônica
        • mantenha as frutas, gelo e ervas da receita
        • se quiser mais corpo, adicione 30 ml de suco ou xarope simples

        O resultado fica mais leve, refrescante e seguro para quem não consome álcool.
        """
    }
}
