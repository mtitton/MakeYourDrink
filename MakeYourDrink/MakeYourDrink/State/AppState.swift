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

    init() {
        self.userIngredients = LocalStorageService.loadUserIngredients() ?? MockData.userBar
        self.favoriteDrinkIDs = LocalStorageService.loadFavoriteDrinkIDs()
        self.preferences = LocalStorageService.loadUserPreferences()
        self.savedAISuggestions = LocalStorageService.loadAISuggestions()
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
}
