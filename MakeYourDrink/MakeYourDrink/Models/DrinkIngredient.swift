//
//  DrinkIngredient.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

struct DrinkIngredient: Identifiable, Hashable, Codable {
    let id: UUID
    let name: String
    let amount: Double
    let unit: DrinkUnit

    init(
        id: UUID = UUID(),
        name: String,
        amount: Double,
        unit: DrinkUnit
    ) {
        self.id = id
        self.name = name
        self.amount = amount
        self.unit = unit
    }
}

enum DrinkUnit: String, Codable {
    case ml = "ml"
    case piece = "un"
    case leaf = "folhas"
}
