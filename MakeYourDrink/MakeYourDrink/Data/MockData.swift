//
//  MockData.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

enum MockData {
    static let ingredients: [Ingredient] = [
        Ingredient(name: "Gin", category: .spirits, isAlcoholic: true),
        Ingredient(name: "Vodka", category: .spirits, isAlcoholic: true),
        Ingredient(name: "Rum", category: .spirits, searchAliases: ["Rum Branco", "Rum Ouro", "Rum Escuro"], isAlcoholic: true),
        Ingredient(name: "Cachaça", category: .spirits, isAlcoholic: true),
        Ingredient(name: "Whisky", category: .spirits, searchAliases: ["Bourbon", "Whisky Rye", "Whisky Irlandês"], isAlcoholic: true),
        Ingredient(name: "Tequila", category: .spirits, isAlcoholic: true),
        Ingredient(name: "Mezcal", category: .spirits, isAlcoholic: true),
        Ingredient(name: "Brandy", category: .spirits, searchAliases: ["Cognac", "Conhaque"], isAlcoholic: true),
        Ingredient(name: "Absinto", category: .spirits, isAlcoholic: true),

        Ingredient(name: "Triple Sec", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Blue Curaçao", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor de Café", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor de Cacau Branco", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor Maraschino", category: .liqueurs, searchAliases: ["Maraschino"], isAlcoholic: true),
        Ingredient(name: "Licor de Cereja", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor de Framboesa", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor de Banana", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor de Maçã", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor de Damasco", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor de Baunilha", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor de Pêssego", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Amaretto", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Galliano", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Midori", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Chartreuse Verde", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Chartreuse Amarela", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Bénédictine", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "St-Germain", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Drambuie", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Sambuca", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Crème de Violette", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Falernum", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Crème de Noyaux", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor Irlandês", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Aperol", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Campari", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Amaro", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Amaro Picon", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor de Amora", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor de Cacau", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor de Cassis", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor de Creme", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor de Hortelã", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor de Hortelã Verde", category: .liqueurs, isAlcoholic: true),
        Ingredient(name: "Licor St-Germain", category: .liqueurs, isAlcoholic: true),

        Ingredient(name: "Vermute Rosso", category: .wines, isAlcoholic: true),
        Ingredient(name: "Vermute Seco", category: .wines, isAlcoholic: true),
        Ingredient(name: "Vermute Lillet", category: .wines, isAlcoholic: true),
        Ingredient(name: "Vinho Tinto", category: .wines, isAlcoholic: true),
        Ingredient(name: "Vinho Branco", category: .wines, isAlcoholic: true),
        Ingredient(name: "Vinho Rosé", category: .wines, isAlcoholic: true),
        Ingredient(name: "Espumante", category: .wines, isAlcoholic: true),
        Ingredient(name: "Espumante Rosé", category: .wines, isAlcoholic: true),
        Ingredient(name: "Vinho do Porto", category: .wines, isAlcoholic: true),
        Ingredient(name: "Vinho do Porto Branco", category: .wines, isAlcoholic: true),
        Ingredient(name: "Jerez Fino", category: .wines, isAlcoholic: true),
        Ingredient(name: "Vermute Branco", category: .wines, isAlcoholic: true),

        Ingredient(name: "Lager", category: .beers, isAlcoholic: true),
        Ingredient(name: "Stout", category: .beers, searchAliases: ["Cerveja Stout"], isAlcoholic: true),
        Ingredient(name: "Corona", category: .beers, isAlcoholic: true),
        Ingredient(name: "Cidra", category: .beers, isAlcoholic: true),

        Ingredient(name: "Água Tônica", category: .mixers),
        Ingredient(name: "Água com gás", category: .mixers),
        Ingredient(name: "Água Quente", category: .mixers),
        Ingredient(name: "Refrigerante Cola", category: .mixers),
        Ingredient(name: "Refrigerante Limão", category: .mixers),
        Ingredient(name: "Refrigerante de Limão", category: .mixers),
        Ingredient(name: "Limonada", category: .mixers),
        Ingredient(name: "Água de Coco", category: .mixers),
        Ingredient(name: "Ginger Ale", category: .mixers),
        Ingredient(name: "Ginger Beer", category: .mixers),
        Ingredient(name: "Ginger Beer Sem Álcool", category: .mixers),

        Ingredient(name: "Suco de Limão", category: .juices),
        Ingredient(name: "Suco de Limão Siciliano", category: .juices),
        Ingredient(name: "Suco de Laranja", category: .juices),
        Ingredient(name: "Suco de Cranberry", category: .juices),
        Ingredient(name: "Suco de Abacaxi", category: .juices),
        Ingredient(name: "Suco de Grapefruit", category: .juices),
        Ingredient(name: "Suco de Tomate", category: .juices),
        Ingredient(name: "Suco de Manga", category: .juices),
        Ingredient(name: "Suco de Maracujá", category: .juices),
        Ingredient(name: "Suco de Pêssego", category: .juices),
        Ingredient(name: "Suco de Maçã", category: .juices),
        Ingredient(name: "Suco de Melancia", category: .juices),
        Ingredient(name: "Suco de Cereja", category: .juices),
        Ingredient(name: "Suco de Romã", category: .juices),
        Ingredient(name: "Suco de Tangerina", category: .juices),

        Ingredient(name: "Xarope de Açúcar", category: .syrups),
        Ingredient(name: "Grenadine", category: .syrups),
        Ingredient(name: "Mel", category: .syrups),
        Ingredient(name: "Orgeat", category: .syrups),
        Ingredient(name: "Xarope de Agave", category: .syrups),
        Ingredient(name: "Xarope de Lavanda", category: .syrups),

        Ingredient(name: "Limão", category: .fruits),
        Ingredient(name: "Laranja", category: .fruits),
        Ingredient(name: "Morango", category: .fruits),
        Ingredient(name: "Framboesa", category: .fruits),
        Ingredient(name: "Mirtilo", category: .fruits),
        Ingredient(name: "Amoras", category: .fruits),
        Ingredient(name: "Abacaxi", category: .fruits),
        Ingredient(name: "Maracujá", category: .fruits),
        Ingredient(name: "Maçã", category: .fruits),
        Ingredient(name: "Maçã Verde", category: .fruits),
        Ingredient(name: "Banana", category: .fruits),
        Ingredient(name: "Pêssego", category: .fruits),
        Ingredient(name: "Kiwi", category: .fruits),
        Ingredient(name: "Melancia", category: .fruits),
        Ingredient(name: "Cereja", category: .fruits),
        Ingredient(name: "Romã", category: .fruits),
        Ingredient(name: "Pepino", category: .fruits),
        Ingredient(name: "Uva", category: .fruits),

        Ingredient(name: "Hortelã", category: .herbs),
        Ingredient(name: "Alecrim", category: .herbs),
        Ingredient(name: "Manjericão", category: .herbs),
        Ingredient(name: "Lavanda", category: .herbs),

        Ingredient(name: "Creme de Leite", category: .dairy),
        Ingredient(name: "Leite", category: .dairy),
        Ingredient(name: "Leite de Coco", category: .dairy),
        
        Ingredient(name: "Clara de Ovo", category: .eggs),
        Ingredient(name: "Ovo", category: .eggs),

        Ingredient(name: "Canela", category: .spices),
        Ingredient(name: "Noz-moscada", category: .spices),
        Ingredient(name: "Gengibre", category: .spices),
        Ingredient(name: "Sal", category: .spices),
        Ingredient(name: "Pimenta-do-reino", category: .spices),
        Ingredient(name: "Pimenta Jalapeño", category: .spices),
        Ingredient(name: "Cardamomo", category: .spices),
        Ingredient(name: "Cravo", category: .spices),

        Ingredient(name: "Angostura", category: .bitters),
        Ingredient(name: "Molho Inglês", category: .bitters),
        Ingredient(name: "Molho de Pimenta", category: .bitters),
        
        Ingredient(name: "Azeitona", category: .garnishes),
        Ingredient(name: "Casca de Limão", category: .garnishes),
        Ingredient(name: "Casca de Laranja", category: .garnishes),
        Ingredient(name: "Fatia de Limão", category: .garnishes),
        Ingredient(name: "Fatia de Laranja", category: .garnishes),
        Ingredient(name: "Ramo de Hortelã", category: .garnishes),
        Ingredient(name: "Borda de Sal", category: .garnishes),
        Ingredient(name: "Borda de Açúcar", category: .garnishes),

        Ingredient(name: "Açúcar", category: .others),
        Ingredient(name: "Açúcar Mascavo", category: .others),
        Ingredient(name: "Gelo", category: .others),
        Ingredient(name: "Café", category: .others),
        Ingredient(name: "Espresso", category: .others),
        Ingredient(name: "Blue Curaçao Sem Álcool", category: .others),
        Ingredient(name: "Purê de Pêssego", category: .others),
        Ingredient(name: "Purê de Morango", category: .others),
        Ingredient(name: "Uvas Passas", category: .others)
    ]

    static let userBar: [Ingredient] = [
        Ingredient(name: "Gin", category: .spirits, isAlcoholic: true),
        Ingredient(name: "Suco de Limão", category: .juices),
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
