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
}
