//
//  IngredientCategory.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

enum IngredientCategory: String, CaseIterable, Identifiable, Codable {
    case spirits = "Destilados"
    case fruits = "Frutas"
    case mixers = "Mixers"
    case herbs = "Ervas"
    case syrups = "Xaropes"
    case others = "Outros"

    var id: String { rawValue }
}
