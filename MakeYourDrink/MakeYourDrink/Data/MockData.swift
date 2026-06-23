//
//  MockData.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

enum MockData {
    static let ingredients: [Ingredient] = [
        
        // Destilados
        Ingredient(name: "Gin", category: .spirits),
        Ingredient(name: "Vodka", category: .spirits),
        Ingredient(name: "Rum", category: .spirits),
        Ingredient(name: "Cachaça", category: .spirits),
        Ingredient(name: "Whisky", category: .spirits),
        Ingredient(name: "Tequila", category: .spirits),
        Ingredient(name: "Aperol", category: .spirits),
        Ingredient(name: "Vermute", category: .spirits),

        // Frutas
        Ingredient(name: "Limão", category: .fruits),
        Ingredient(name: "Laranja", category: .fruits),
        Ingredient(name: "Abacaxi", category: .fruits),
        Ingredient(name: "Morango", category: .fruits),
        Ingredient(name: "Maracujá", category: .fruits),

        // Mixers
        Ingredient(name: "Água Tônica", category: .mixers),
        Ingredient(name: "Água com gás", category: .mixers),
        Ingredient(name: "Refrigerante Cola", category: .mixers),
        Ingredient(name: "Suco de Laranja", category: .mixers),
        Ingredient(name: "Ginger Beer", category: .mixers),

        // Ervas
        Ingredient(name: "Hortelã", category: .herbs),
        Ingredient(name: "Alecrim", category: .herbs),
        Ingredient(name: "Manjericão", category: .herbs),

        // Xaropes
        Ingredient(name: "Xarope de Açúcar", category: .syrups),
        Ingredient(name: "Grenadine", category: .syrups),

        // Outros
        Ingredient(name: "Açúcar", category: .others),
        Ingredient(name: "Gelo", category: .others),
        Ingredient(name: "Canela", category: .others)
    ]
    
    static let userBar: [Ingredient] = [
        Ingredient(name: "Gin", category: .spirits),
        Ingredient(name: "Limão", category: .fruits),
        Ingredient(name: "Água Tônica", category: .mixers),
        Ingredient(name: "Hortelã", category: .herbs)
    ]
    
    static let drinks: [Drink] = [
        Drink(
            id: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!,
            name: "Gin Tônica",
            description: "Clássico, leve e refrescante.",
            imageName: "gin_tonic",
            ingredients: ["Gin", "Água Tônica", "Limão", "Gelo"],
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
            ingredients: ["Rum", "Limão", "Açúcar", "Hortelã", "Água com gás", "Gelo"],
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
            ingredients: ["Cachaça", "Limão", "Açúcar", "Gelo"],
            instructions: [
                "Corte o limão.",
                "Macere com açúcar.",
                "Adicione gelo.",
                "Complete com cachaça."
            ],
            alcoholicLevel: .high,
            difficulty: .easy
        ),
        Drink(
            id: UUID(uuidString: "44444444-4444-4444-4444-444444444444")!,
            name: "Moscow Mule",
            description: "Picante, cítrico e muito refrescante.",
            imageName: "moscow_mule",
            ingredients: ["Vodka", "Limão", "Ginger Beer", "Gelo"],
            instructions: [
                "Adicione gelo em uma caneca.",
                "Coloque vodka e limão.",
                "Complete com ginger beer.",
                "Misture suavemente."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),
        Drink(
            id: UUID(uuidString: "55555555-5555-5555-5555-555555555555")!,
            name: "Aperol Spritz",
            description: "Leve, amargo e perfeito para o fim de tarde.",
            imageName: "aperol_spritz",
            ingredients: ["Aperol", "Água com gás", "Laranja", "Gelo"],
            instructions: [
                "Adicione gelo em uma taça.",
                "Coloque Aperol.",
                "Complete com água com gás.",
                "Finalize com laranja."
            ],
            alcoholicLevel: .low,
            difficulty: .easy
        ),
        Drink(
            id: UUID(uuidString: "66666666-6666-6666-6666-666666666666")!,
            name: "Cuba Libre",
            description: "Simples, doce e clássico.",
            imageName: "cuba_libre",
            ingredients: ["Rum", "Refrigerante Cola", "Limão", "Gelo"],
            instructions: [
                "Adicione gelo em um copo.",
                "Coloque rum.",
                "Complete com refrigerante cola.",
                "Finalize com limão."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),
        Drink(
            id: UUID(uuidString: "77777777-7777-7777-7777-777777777777")!,
            name: "Whisky Citrus",
            description: "Um drink cítrico e encorpado com whisky.",
            imageName: "whisky_citrus",
            ingredients: ["Whisky", "Limão", "Xarope de Açúcar", "Gelo"],
            instructions: [
                "Adicione whisky, limão e xarope em uma coqueteleira.",
                "Bata com gelo.",
                "Coe para um copo baixo.",
                "Finalize com gelo novo."
            ],
            alcoholicLevel: .high,
            difficulty: .medium
        ),
        Drink(
            id: UUID(uuidString: "88888888-8888-8888-8888-888888888888")!,
            name: "Tequila Sunrise",
            description: "Colorido, frutado e visualmente marcante.",
            imageName: "tequila_sunrise",
            ingredients: ["Tequila", "Suco de Laranja", "Grenadine", "Gelo"],
            instructions: [
                "Adicione gelo em um copo alto.",
                "Coloque tequila e suco de laranja.",
                "Adicione grenadine lentamente.",
                "Não misture para criar o efeito degradê."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium
        ),
        Drink(
            id: UUID(uuidString: "99999999-9999-9999-9999-999999999999")!,
            name: "Morango Fizz",
            description: "Doce, leve e refrescante.",
            imageName: "morango_fizz",
            ingredients: ["Vodka", "Morango", "Água com gás", "Xarope de Açúcar", "Gelo"],
            instructions: [
                "Macere os morangos com xarope.",
                "Adicione vodka e gelo.",
                "Complete com água com gás.",
                "Misture suavemente."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),
        Drink(
            id: UUID(uuidString: "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa")!,
            name: "Maracujá Sour",
            description: "Azedinho, tropical e equilibrado.",
            imageName: "maracuja_sour",
            ingredients: ["Vodka", "Maracujá", "Xarope de Açúcar", "Limão", "Gelo"],
            instructions: [
                "Adicione todos os ingredientes na coqueteleira.",
                "Bata bem com gelo.",
                "Coe para uma taça.",
                "Finalize com sementes de maracujá."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium
        )
    ]
}
