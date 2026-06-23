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
        Ingredient(name: "Tequila", category: .spirits),
        Ingredient(name: "Aperol", category: .spirits),
        Ingredient(name: "Limão", category: .fruits),
        Ingredient(name: "Laranja", category: .fruits),
        Ingredient(name: "Morango", category: .fruits),
        Ingredient(name: "Maracujá", category: .fruits),
        Ingredient(name: "Água Tônica", category: .mixers),
        Ingredient(name: "Água com gás", category: .mixers),
        Ingredient(name: "Refrigerante Cola", category: .mixers),
        Ingredient(name: "Suco de Laranja", category: .mixers),
        Ingredient(name: "Ginger Beer", category: .mixers),
        Ingredient(name: "Hortelã", category: .herbs),
        Ingredient(name: "Alecrim", category: .herbs),
        Ingredient(name: "Xarope de Açúcar", category: .syrups),
        Ingredient(name: "Grenadine", category: .syrups),
        Ingredient(name: "Açúcar", category: .others),
        Ingredient(name: "Gelo", category: .others)
    ]

    static let userBar: [Ingredient] = [
        Ingredient(name: "Gin", category: .spirits),
        Ingredient(name: "Limão", category: .fruits),
        Ingredient(name: "Água Tônica", category: .mixers),
        Ingredient(name: "Hortelã", category: .herbs),
        Ingredient(name: "Gelo", category: .others)
    ]

    static let drinks: [Drink] = [
        Drink(
            id: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!,
            name: "Gin Tônica",
            description: "Clássico, leve e refrescante.",
            imageName: "gin_tonic",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Água Tônica", amount: 150, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
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
            id: UUID(uuidString: "22222222-2222-2222-2222-222222222222")!,
            name: "Mojito",
            description: "Refrescante, cítrico e aromático.",
            imageName: "mojito",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Açúcar", amount: 2, unit: .piece),
                DrinkIngredient(name: "Hortelã", amount: 8, unit: .leaf),
                DrinkIngredient(name: "Água com gás", amount: 100, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
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
            id: UUID(uuidString: "33333333-3333-3333-3333-333333333333")!,
            name: "Caipirinha",
            description: "O clássico brasileiro.",
            imageName: "caipirinha",
            ingredients: [
                DrinkIngredient(name: "Cachaça", amount: 50, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Açúcar", amount: 2, unit: .piece),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
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
