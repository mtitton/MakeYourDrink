//
//  DrinkWizardService.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import Foundation

enum DrinkWizardService {
    static func prompt(
        from request: DrinkWizardRequest,
        userIngredients: [Ingredient]
    ) -> String {
        let ingredients = userIngredients
            .map { $0.name }
            .joined(separator: ", ")

        let selectedBase = request.base?.rawValue ?? "Tanto faz"

        return """
        Crie UM drink personalizado respeitando obrigatoriamente as preferências abaixo.

        REGRAS IMPORTANTES:
        - A base alcoólica escolhida deve ser respeitada.
        - Se a base for "\(selectedBase)" e não for "Tanto faz", o drink DEVE usar \(selectedBase) como ingrediente principal.
        - Não substitua a base alcoólica por outra.
        - Não use Gin se a base escolhida for Vodka.
        - Não use Vodka se a base escolhida for Gin.
        - O nome do drink deve combinar com a base escolhida.
        - Retorne apenas uma receita.

        Preferências:
        Estilo desejado: \(request.mood?.rawValue ?? "Não definido")
        Base alcoólica obrigatória: \(selectedBase)
        Intensidade: \(request.intensity?.rawValue ?? "Não definido")
        Frutas/sabores desejados: \(request.fruits.isEmpty ? "Não definido" : request.fruits.map { $0.rawValue }.joined(separator: ", "))
        Ocasião: \(request.occasion?.rawValue ?? "Não definido")
        Pessoas: \(request.servings)
        Pode usar ingredientes que o usuário não possui: \(request.allowMissingIngredients ? "Sim" : "Não")

        Ingredientes disponíveis no Meu Bar:
        \(ingredients.isEmpty ? "Nenhum ingrediente cadastrado" : ingredients)

        Formato da resposta:
        - Nome do drink
        - Descrição curta
        - Ingredientes com quantidades
        - Modo de preparo em passos
        - Dica final
        """
    }
}
