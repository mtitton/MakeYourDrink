//
//  Drink+AISuggestion.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 27/06/26.
//

import Foundation

extension Drink {
    var aiSuggestion: AIBartenderSuggestion {
        AIBartenderSuggestion(
            name: name,
            description: description,
            ingredients: ingredients,
            instructions: instructions
        )
    }
}
