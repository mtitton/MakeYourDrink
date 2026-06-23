//
//  Drink.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

struct Drink: Identifiable, Hashable {
    let id: UUID
    let name: String
    let description: String
    let imageName: String
    let ingredients: [String]
    let instructions: [String]
    let alcoholicLevel: AlcoholicLevel
    let difficulty: Difficulty

    init(
        id: UUID = UUID(),
        name: String,
        description: String,
        imageName: String,
        ingredients: [String],
        instructions: [String],
        alcoholicLevel: AlcoholicLevel,
        difficulty: Difficulty
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.imageName = imageName
        self.ingredients = ingredients
        self.instructions = instructions
        self.alcoholicLevel = alcoholicLevel
        self.difficulty = difficulty
    }
}

enum AlcoholicLevel: String, Hashable {
    case low = "Baixo"
    case medium = "Médio"
    case high = "Alto"
}

enum Difficulty: String, Hashable {
    case easy = "Fácil"
    case medium = "Médio"
    case hard = "Difícil"
}
