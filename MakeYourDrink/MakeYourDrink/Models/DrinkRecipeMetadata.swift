//
//  DrinkRecipeMetadata.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 27/06/26.
//

import Foundation

struct DrinkRecipeMetadata: Hashable {
    let preparationTime: String
    let servings: String
    let alcoholLevel: String
    let glass: String
    let method: String
    let difficulty: String
    let pairing: [String]
}
