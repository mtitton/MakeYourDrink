//
//  DrinkIngredient.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

struct DrinkIngredient: Identifiable, Hashable {
    let id = UUID()

    let name: String
    let amount: Double
    let unit: Unit
}

enum Unit: String {
    case ml = "ml"
    case piece = "un"
    case leaf = "folhas"
}
