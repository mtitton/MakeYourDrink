//
//  Drink.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

struct Drink: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
    let ingredients: [String]
    let instructions: [String]
    let alcoholicLevel: AlcoholicLevel
    let difficulty: Difficulty
}

enum AlcoholicLevel: String {
    case low = "Baixo"
    case medium = "Médio"
    case high = "Alto"
}

enum Difficulty: String {
    case easy = "Fácil"
    case medium = "Médio"
    case hard = "Difícil"
}
