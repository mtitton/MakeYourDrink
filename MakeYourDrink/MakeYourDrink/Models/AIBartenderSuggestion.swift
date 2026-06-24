//
//  AIBartenderSuggestion.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import Foundation

struct AIBartenderSuggestion: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let description: String
    let ingredients: [DrinkIngredient]
    let instructions: [String]

    init(
        id: UUID = UUID(),
        name: String,
        description: String,
        ingredients: [DrinkIngredient],
        instructions: [String]
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.ingredients = ingredients
        self.instructions = instructions
    }
}
