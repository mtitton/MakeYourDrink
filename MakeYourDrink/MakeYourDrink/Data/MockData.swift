//
//  MockData.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

enum MockData {
    static let ingredients: [Ingredient] = [
        Ingredient(name: "Gin", category: .spirits),
        Ingredient(name: "Vodka", category: .spirits),
        Ingredient(name: "Rum", category: .spirits),
        Ingredient(name: "Cachaça", category: .spirits),
        Ingredient(name: "Whisky", category: .spirits),
        Ingredient(name: "Limão", category: .fruits),
        Ingredient(name: "Laranja", category: .fruits),
        Ingredient(name: "Hortelã", category: .herbs),
        Ingredient(name: "Água Tônica", category: .mixers),
        Ingredient(name: "Água com gás", category: .mixers),
        Ingredient(name: "Açúcar", category: .others)
    ]

    static let userBar: [Ingredient] = [
        Ingredient(name: "Gin", category: .spirits),
        Ingredient(name: "Limão", category: .fruits),
        Ingredient(name: "Água Tônica", category: .mixers),
        Ingredient(name: "Hortelã", category: .herbs)
    ]

    static let drinks: [Drink] = [
        Drink(
            name: "Gin Tônica",
            description: "Clássico, leve e refrescante.",
            imageName: "gin_tonic",
            ingredients: ["Gin", "Água Tônica", "Limão"],
            instructions: [
                "Adicione gelo em uma taça.",
                "Coloque o gin.",
                "Complete com água tônica.",
                "Finalize com limão."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),
        Drink(
            name: "Mojito",
            description: "Refrescante, cítrico e aromático.",
            imageName: "mojito",
            ingredients: ["Rum", "Limão", "Açúcar", "Hortelã", "Água com gás"],
            instructions: [
                "Macere limão, açúcar e hortelã.",
                "Adicione rum.",
                "Complete com gelo.",
                "Finalize com água com gás."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),
        Drink(
            name: "Caipirinha",
            description: "O clássico brasileiro.",
            imageName: "caipirinha",
            ingredients: ["Cachaça", "Limão", "Açúcar"],
            instructions: [
                "Corte o limão.",
                "Macere com açúcar.",
                "Adicione gelo.",
                "Complete com cachaça."
            ],
            alcoholicLevel: .high,
            difficulty: .easy
        )
    ]
}
