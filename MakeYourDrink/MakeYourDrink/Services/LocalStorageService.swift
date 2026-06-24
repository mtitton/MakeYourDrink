//
//  LocalStorageService.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

final class LocalStorageService {
    private enum Keys {
        static let userIngredients = "make_your_drink_user_ingredients"
        static let favoriteDrinkIDs = "make_your_drink_favorite_drink_ids"
        static let userPreferences = "make_your_drink_user_preferences"
        static let savedAISuggestions = "make_your_drink_saved_ai_suggestions"
        static let drinkHistory = "make_your_drink_history"
    }

    static func saveUserIngredients(_ ingredients: [Ingredient]) {
        guard let data = try? JSONEncoder().encode(ingredients) else { return }
        UserDefaults.standard.set(data, forKey: Keys.userIngredients)
    }

    static func loadUserIngredients() -> [Ingredient]? {
        guard let data = UserDefaults.standard.data(forKey: Keys.userIngredients) else {
            return nil
        }

        return try? JSONDecoder().decode([Ingredient].self, from: data)
    }

    static func saveFavoriteDrinkIDs(_ ids: Set<UUID>) {
        let values = ids.map { $0.uuidString }
        UserDefaults.standard.set(values, forKey: Keys.favoriteDrinkIDs)
    }

    static func loadFavoriteDrinkIDs() -> Set<UUID> {
        let values = UserDefaults.standard.stringArray(forKey: Keys.favoriteDrinkIDs) ?? []
        return Set(values.compactMap { UUID(uuidString: $0) })
    }
    
    static func saveUserPreferences(_ preferences: UserPreferences) {
        guard let data = try? JSONEncoder().encode(preferences) else { return }
        UserDefaults.standard.set(data, forKey: Keys.userPreferences)
    }

    static func loadUserPreferences() -> UserPreferences {
        guard let data = UserDefaults.standard.data(forKey: Keys.userPreferences),
              let preferences = try? JSONDecoder().decode(UserPreferences.self, from: data) else {
            return UserPreferences()
        }

        return preferences
    }
    
    static func saveAISuggestions(_ suggestions: [AIBartenderSuggestion]) {
        guard let data = try? JSONEncoder().encode(suggestions) else { return }
        UserDefaults.standard.set(data, forKey: Keys.savedAISuggestions)
    }

    static func loadAISuggestions() -> [AIBartenderSuggestion] {
        guard let data = UserDefaults.standard.data(forKey: Keys.savedAISuggestions),
              let suggestions = try? JSONDecoder().decode([AIBartenderSuggestion].self, from: data) else {
            return []
        }

        return suggestions
    }
    
    static func saveDrinkHistory(_ history: [DrinkHistoryItem]) {
        guard let data = try? JSONEncoder().encode(history) else { return }
        UserDefaults.standard.set(data, forKey: Keys.drinkHistory)
    }

    static func loadDrinkHistory() -> [DrinkHistoryItem] {
        guard let data = UserDefaults.standard.data(forKey: Keys.drinkHistory),
              let history = try? JSONDecoder().decode([DrinkHistoryItem].self, from: data) else {
            return []
        }

        return history
    }
}
