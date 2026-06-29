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
        Ingredient(name: "Abacaxi", category: .fruits),
        Ingredient(name: "Água Tônica", category: .mixers),
        Ingredient(name: "Água com gás", category: .mixers),
        Ingredient(name: "Refrigerante Cola", category: .mixers),
        Ingredient(name: "Suco de Laranja", category: .mixers),
        Ingredient(name: "Ginger Beer", category: .mixers),
        Ingredient(name: "Hortelã", category: .herbs),
        Ingredient(name: "Alecrim", category: .herbs),
        Ingredient(name: "Manjericão", category: .herbs),
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

    static let drinks: [Drink] =
        ClassicDrinks.items +
        GinDrinks.items +
        VodkaDrinks.items +
        RumDrinks.items +
        WhiskyDrinks.items +
        TequilaDrinks.items +
        MocktailDrinks.items +
        BrandyDrinks.items +
        LiqueurDrinks.items +
        WineDrinks.items +
        BeerDrinks.items +
        ChampagneDrinks.items
}
