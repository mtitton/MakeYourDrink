//
//  UserContext.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import Foundation

struct UserContext {
    let ingredients: [String]
    let favoriteBases: [String]
    let favoriteFlavors: [String]
    let preferredAlcoholLevel: String
    let favoriteDrinks: [String]
    let recentDrinks: [String]
    let averageRating: Double

    static func build(
        appState: AppState
    ) -> UserContext {
        let favoriteDrinks = appState.matches
            .filter { appState.favoriteDrinkIDs.contains($0.drink.id) }
            .map { $0.drink.name }

        let recentDrinks = appState.drinkHistory
            .prefix(5)
            .map { $0.drinkName }

        let averageRating: Double = {
            guard !appState.drinkRatings.isEmpty else { return 0 }

            let total = appState.drinkRatings.reduce(0) {
                $0 + $1.rating
            }

            return Double(total) / Double(appState.drinkRatings.count)
        }()

        return UserContext(
            ingredients: appState.userIngredients.map { $0.name },
            favoriteBases: appState.preferences.favoriteBases,
            favoriteFlavors: appState.preferences.favoriteFlavors,
            preferredAlcoholLevel: appState.preferences.preferredAlcoholLevel.rawValue,
            favoriteDrinks: favoriteDrinks,
            recentDrinks: recentDrinks,
            averageRating: averageRating
        )
    }
}
