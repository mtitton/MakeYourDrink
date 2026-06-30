//
//  Ingredient.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

struct Ingredient: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let category: IngredientCategory
    let imageName: String
    let searchAliases: [String]
    let isAlcoholic: Bool

    init(
        id: UUID = UUID(),
        name: String,
        category: IngredientCategory,
        imageName: String? = nil,
        searchAliases: [String] = [],
        isAlcoholic: Bool = false
    ) {
        self.id = id
        self.name = name
        self.category = category
        self.imageName = imageName ?? name
            .lowercased()
            .folding(options: .diacriticInsensitive, locale: .current)
            .replacingOccurrences(of: " ", with: "_")
        self.searchAliases = searchAliases
        self.isAlcoholic = isAlcoholic
    }
}
