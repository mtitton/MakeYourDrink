//
//  Ingredient.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

struct Ingredient: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let category: IngredientCategory
}
