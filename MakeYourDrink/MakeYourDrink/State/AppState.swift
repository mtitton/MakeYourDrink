//
//  AppState.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation
import Combine

@MainActor
final class AppState: ObservableObject {
    @Published var userIngredients: [Ingredient] {
        didSet {
            LocalStorageService.saveUserIngredients(userIngredients)
        }
    }

    @Published var favoriteDrinkIDs: Set<UUID> {
        didSet {
            LocalStorageService.saveFavoriteDrinkIDs(favoriteDrinkIDs)
        }
    }
    
    @Published var preferences: UserPreferences {
        didSet {
            LocalStorageService.saveUserPreferences(preferences)
        }
    }
    
    @Published var savedAISuggestions: [AIBartenderSuggestion] {
        didSet {
            LocalStorageService.saveAISuggestions(savedAISuggestions)
        }
    }
    
    @Published var drinkHistory: [DrinkHistoryItem] {
        didSet {
            LocalStorageService.saveDrinkHistory(drinkHistory)
        }
    }
    
    @Published var drinkRatings: [DrinkRating] {
        didSet {
            LocalStorageService.saveDrinkRatings(drinkRatings)
        }
    }

    init() {
        self.userIngredients = LocalStorageService.loadUserIngredients() ?? MockData.userBar
        self.favoriteDrinkIDs = LocalStorageService.loadFavoriteDrinkIDs()
        self.preferences = LocalStorageService.loadUserPreferences()
        self.savedAISuggestions = LocalStorageService.loadAISuggestions()
        self.drinkHistory = LocalStorageService.loadDrinkHistory()
        self.drinkRatings = LocalStorageService.loadDrinkRatings()
    }

    var matches: [DrinkMatch] {
        DrinkMatcher.match(
            drinks: MockData.drinks,
            userIngredients: userIngredients
        )
    }

    func toggleIngredient(_ ingredient: Ingredient) {
        if userIngredients.contains(ingredient) {
            userIngredients.removeAll { $0 == ingredient }
        } else {
            userIngredients.append(ingredient)
        }
    }

    func hasIngredient(_ ingredient: Ingredient) -> Bool {
        userIngredients.contains(ingredient)
    }

    func toggleFavorite(_ drink: Drink) {
        if favoriteDrinkIDs.contains(drink.id) {
            favoriteDrinkIDs.remove(drink.id)
        } else {
            favoriteDrinkIDs.insert(drink.id)
        }
    }

    func isFavorite(_ drink: Drink) -> Bool {
        favoriteDrinkIDs.contains(drink.id)
    }
    
    func saveAISuggestion(_ suggestion: AIBartenderSuggestion) {
        if !savedAISuggestions.contains(where: { $0.id == suggestion.id }) {
            savedAISuggestions.append(suggestion)
        }
    }

    func isAISuggestionSaved(_ suggestion: AIBartenderSuggestion) -> Bool {
        savedAISuggestions.contains(where: { $0.id == suggestion.id })
    }
    
    func registerPreparedDrink(_ drink: Drink) {
        let item = DrinkHistoryItem(
            drinkID: drink.id,
            drinkName: drink.name,
            imageName: drink.imageName
        )

        drinkHistory.removeAll { $0.drinkID == drink.id }
        drinkHistory.insert(item, at: 0)

        if drinkHistory.count > 20 {
            drinkHistory = Array(drinkHistory.prefix(20))
        }
    }
    
    func rateDrink(_ drink: Drink, rating: Int) {
        drinkRatings.removeAll { $0.drinkID == drink.id }

        let item = DrinkRating(
            drinkID: drink.id,
            rating: rating
        )

        drinkRatings.append(item)
    }

    func rating(for drink: Drink) -> Int? {
        drinkRatings.first { $0.drinkID == drink.id }?.rating
    }
}
