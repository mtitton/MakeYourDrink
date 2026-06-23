//
//  Ingredient.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

struct Ingredient: Identifiable, Hashable, Codable {
    let id: UUID
    let name: String
    let category: IngredientCategory

    init(id: UUID = UUID(), name: String, category: IngredientCategory) {
        self.id = id
        self.name = name
        self.category = category
    }
}
