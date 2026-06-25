//
//  AchievementService.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import Foundation

enum AchievementService {
    static func achievements(appState: AppState) -> [Achievement] {
        [
            Achievement(
                title: "Primeiro Drink",
                description: "Prepare seu primeiro drink.",
                icon: "wineglass.fill",
                current: appState.drinkHistory.count,
                target: 1
            ),
            Achievement(
                title: "Bartender",
                description: "Prepare 5 drinks.",
                icon: "medal.fill",
                current: appState.drinkHistory.count,
                target: 5
            ),
            Achievement(
                title: "Mestre dos Drinks",
                description: "Prepare 10 drinks.",
                icon: "trophy.fill",
                current: appState.drinkHistory.count,
                target: 10
            ),
            Achievement(
                title: "Primeiro Ingrediente",
                description: "Adicione um ingrediente ao Meu Bar.",
                icon: "shippingbox.fill",
                current: appState.userIngredients.count,
                target: 1
            ),
            Achievement(
                title: "Bar Completo",
                description: "Tenha 20 ingredientes.",
                icon: "sparkles",
                current: appState.userIngredients.count,
                target: 20
            ),
            Achievement(
                title: "Primeiro Favorito",
                description: "Favorite um drink.",
                icon: "heart.fill",
                current: appState.favoriteDrinkIDs.count,
                target: 1
            ),
            Achievement(
                title: "Colecionador",
                description: "Tenha 10 favoritos.",
                icon: "heart.circle.fill",
                current: appState.favoriteDrinkIDs.count,
                target: 10
            ),
            Achievement(
                title: "Primeiro Drink IA",
                description: "Salve um drink criado pela IA.",
                icon: "brain.head.profile",
                current: appState.savedAISuggestions.count,
                target: 1
            ),
            Achievement(
                title: "Especialista em IA",
                description: "Salve 10 drinks criados pela IA.",
                icon: "cpu.fill",
                current: appState.savedAISuggestions.count,
                target: 10
            ),
            Achievement(
                title: "Crítico",
                description: "Avalie seu primeiro drink.",
                icon: "star.fill",
                current: appState.drinkRatings.count,
                target: 1
            ),
            Achievement(
                title: "Crítico Experiente",
                description: "Avalie 10 drinks.",
                icon: "star.circle.fill",
                current: appState.drinkRatings.count,
                target: 10
            )
        ]
    }
}
