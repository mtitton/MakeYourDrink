//
//  AchievementService.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import Foundation

enum AchievementService {

    static func achievements(
        appState: AppState
    ) -> [Achievement] {

        [
            Achievement(
                title: "Primeiro Drink",
                description: "Prepare seu primeiro drink.",
                icon: "wineglass.fill",
                unlocked: appState.drinkHistory.count >= 1
            ),

            Achievement(
                title: "Bartender",
                description: "Prepare 5 drinks.",
                icon: "medal.fill",
                unlocked: appState.drinkHistory.count >= 5
            ),

            Achievement(
                title: "Mestre dos Drinks",
                description: "Prepare 10 drinks.",
                icon: "trophy.fill",
                unlocked: appState.drinkHistory.count >= 10
            ),

            Achievement(
                title: "Primeiro Ingrediente",
                description: "Adicione um ingrediente ao Meu Bar.",
                icon: "shippingbox.fill",
                unlocked: appState.userIngredients.count >= 1
            ),

            Achievement(
                title: "Bar Completo",
                description: "Tenha 20 ingredientes.",
                icon: "sparkles",
                unlocked: appState.userIngredients.count >= 20
            ),

            Achievement(
                title: "Primeiro Favorito",
                description: "Favorite um drink.",
                icon: "heart.fill",
                unlocked: appState.favoriteDrinkIDs.count >= 1
            ),

            Achievement(
                title: "Colecionador",
                description: "Tenha 10 favoritos.",
                icon: "heart.circle.fill",
                unlocked: appState.favoriteDrinkIDs.count >= 10
            ),

            Achievement(
                title: "Primeiro Drink IA",
                description: "Salve um drink criado pela IA.",
                icon: "brain.head.profile",
                unlocked: appState.savedAISuggestions.count >= 1
            ),

            Achievement(
                title: "Especialista em IA",
                description: "Salve 10 drinks IA.",
                icon: "cpu.fill",
                unlocked: appState.savedAISuggestions.count >= 10
            ),

            Achievement(
                title: "Crítico",
                description: "Avalie um drink.",
                icon: "star.fill",
                unlocked: appState.drinkRatings.count >= 1
            )
        ]
    }
}
