//
//  ClassicDrinks.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum ClassicDrinks {
    static let items: [Drink] = [
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
        ),
        Drink(
            id: UUID(uuidString: "44444444-4444-4444-4444-444444444444")!,
            name: "Moscow Mule",
            description: "Picante, cítrico e muito refrescante.",
            imageName: "moscow_mule",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Ginger Beer", amount: 120, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
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
            ingredients: [
                DrinkIngredient(name: "Aperol", amount: 60, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 60, unit: .ml),
                DrinkIngredient(name: "Laranja", amount: 1, unit: .piece),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
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
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Refrigerante Cola", amount: 150, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
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
            name: "Whisky Sour",
            description: "Cítrico, encorpado e equilibrado.",
            imageName: "whisky_sour",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 50, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 20, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione whisky, limão e xarope em uma coqueteleira.",
                "Bata com gelo.",
                "Coe para um copo baixo.",
                "Sirva com gelo novo."
            ],
            alcoholicLevel: .high,
            difficulty: .medium
        ),
        Drink(
            id: UUID(uuidString: "88888888-8888-8888-8888-888888888888")!,
            name: "Tequila Sunrise",
            description: "Colorido, frutado e visualmente marcante.",
            imageName: "tequila_sunrise",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 120, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 15, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
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
            name: "Vodka Lemon",
            description: "Simples, cítrico e refrescante.",
            imageName: "vodka_lemon",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo em um copo.",
                "Coloque vodka e limão.",
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
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Maracujá", amount: 1, unit: .piece),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 20, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione todos os ingredientes na coqueteleira.",
                "Bata bem com gelo.",
                "Coe para uma taça.",
                "Finalize com sementes de maracujá."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium
        ),
        Drink(
            id: UUID(uuidString: "bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb")!,
            name: "Strawberry Gin",
            description: "Frutado, leve e elegante.",
            imageName: "strawberry_gin",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Morango", amount: 4, unit: .piece),
                DrinkIngredient(name: "Água Tônica", amount: 120, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Macere levemente os morangos.",
                "Adicione gin e gelo.",
                "Complete com água tônica.",
                "Misture suavemente."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),
        Drink(
            id: UUID(uuidString: "cccccccc-cccc-cccc-cccc-cccccccccccc")!,
            name: "Rum Punch",
            description: "Tropical, doce e perfeito para festas.",
            imageName: "rum_punch",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 100, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 15, unit: .ml),
                DrinkIngredient(name: "Laranja", amount: 1, unit: .piece),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo em um copo alto.",
                "Coloque rum e suco de laranja.",
                "Adicione grenadine.",
                "Finalize com laranja."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),
        Drink(
            id: UUID(uuidString: "dddddddd-dddd-dddd-dddd-dddddddddddd")!,
            name: "Gin Basil",
            description: "Aromático, herbal e sofisticado.",
            imageName: "gin_basil",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Manjericão", amount: 6, unit: .leaf),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Macere manjericão com limão e xarope.",
                "Adicione gin e gelo.",
                "Bata rapidamente.",
                "Coe para um copo baixo."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium
        ),
        Drink(
            id: UUID(uuidString: "eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee")!,
            name: "Orange Highball",
            description: "Leve, cítrico e fácil de preparar.",
            imageName: "orange_highball",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 45, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 120, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 60, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo em um copo alto.",
                "Coloque whisky e suco de laranja.",
                "Complete com água com gás.",
                "Misture suavemente."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),
        Drink(
            id: UUID(uuidString: "ffffffff-ffff-ffff-ffff-ffffffffffff")!,
            name: "Tropical Vodka",
            description: "Frutado, tropical e refrescante.",
            imageName: "tropical_vodka",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Abacaxi", amount: 3, unit: .piece),
                DrinkIngredient(name: "Água com gás", amount: 100, unit: .ml),
                DrinkIngredient(name: "Hortelã", amount: 6, unit: .leaf),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Macere abacaxi com hortelã.",
                "Adicione vodka e gelo.",
                "Complete com água com gás.",
                "Misture suavemente."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),
        Drink(
            id: UUID(uuidString: "12121212-1212-1212-1212-121212121212")!,
            name: "Rosemary Gin",
            description: "Aromático e sofisticado.",
            imageName: "rosemary_gin",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Alecrim", amount: 2, unit: .leaf),
                DrinkIngredient(name: "Água Tônica", amount: 150, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo.",
                "Coloque gin.",
                "Complete com água tônica.",
                "Finalize com alecrim."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),

        Drink(
            id: UUID(uuidString: "13131313-1313-1313-1313-131313131313")!,
            name: "Vodka Tônica",
            description: "Simples e refrescante.",
            imageName: "vodka_tonic",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Água Tônica", amount: 150, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo.",
                "Coloque vodka.",
                "Complete com água tônica."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),

        Drink(
            id: UUID(uuidString: "14141414-1414-1414-1414-141414141414")!,
            name: "Passion Mule",
            description: "Moscow Mule tropical.",
            imageName: "passion_mule",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Maracujá", amount: 1, unit: .piece),
                DrinkIngredient(name: "Ginger Beer", amount: 120, unit: .ml)
            ],
            instructions: [
                "Misture vodka e maracujá.",
                "Adicione gelo.",
                "Complete com ginger beer."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),

        Drink(
            id: UUID(uuidString: "15151515-1515-1515-1515-151515151515")!,
            name: "Orange Rum",
            description: "Rum com toque cítrico.",
            imageName: "orange_rum",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 120, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo.",
                "Misture rum e suco.",
                "Sirva."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),

        Drink(
            id: UUID(uuidString: "16161616-1616-1616-1616-161616161616")!,
            name: "Whisky Tonic",
            description: "Leve e diferente.",
            imageName: "whisky_tonic",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 45, unit: .ml),
                DrinkIngredient(name: "Água Tônica", amount: 150, unit: .ml)
            ],
            instructions: [
                "Adicione gelo.",
                "Coloque whisky.",
                "Complete com água tônica."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),

        Drink(
            id: UUID(uuidString: "17171717-1717-1717-1717-171717171717")!,
            name: "Berry Vodka",
            description: "Frutado e suave.",
            imageName: "berry_vodka",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Morango", amount: 4, unit: .piece),
                DrinkIngredient(name: "Água com gás", amount: 100, unit: .ml)
            ],
            instructions: [
                "Macere os morangos.",
                "Adicione vodka.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),

        Drink(
            id: UUID(uuidString: "18181818-1818-1818-1818-181818181818")!,
            name: "Citrus Tequila",
            description: "Tequila com perfil refrescante.",
            imageName: "citrus_tequila",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Água com gás", amount: 100, unit: .ml)
            ],
            instructions: [
                "Misture tequila e limão.",
                "Adicione gelo.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .high,
            difficulty: .easy
        ),

        Drink(
            id: UUID(uuidString: "19191919-1919-1919-1919-191919191919")!,
            name: "Sweet Sunset",
            description: "Doce e colorido.",
            imageName: "sweet_sunset",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 120, unit: .ml)
            ],
            instructions: [
                "Misture vodka e suco.",
                "Adicione grenadine.",
                "Sirva."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy
        ),

        Drink(
            id: UUID(uuidString: "20202020-2020-2020-2020-202020202020")!,
            name: "Mint Cooler",
            description: "Extremamente refrescante.",
            imageName: "mint_cooler",
            ingredients: [
                DrinkIngredient(name: "Hortelã", amount: 8, unit: .leaf),
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 150, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece)
            ],
            instructions: [
                "Macere hortelã.",
                "Adicione o rum e o limão.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .low,
            difficulty: .easy
        )
    ]
}
