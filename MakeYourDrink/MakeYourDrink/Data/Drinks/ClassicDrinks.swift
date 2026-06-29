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
        ),
        
        Drink(
            id: UUID(uuidString: "21212121-2121-2121-2121-212121212121")!,
            name: "Negroni",
            description: "Amargo, elegante e intenso.",
            imageName: "negroni",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 30, unit: .ml),
                DrinkIngredient(name: "Aperol", amount: 30, unit: .ml),
                DrinkIngredient(name: "Laranja", amount: 1, unit: .piece),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo em um copo baixo.",
                "Coloque gin e Aperol.",
                "Misture suavemente.",
                "Finalize com laranja."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .rocks,
                origin: "Itália",
                year: "1919",
                garnish: "Laranja",
                flavorProfile: [.bitter, .strong, .dry],
                tags: [.iba, .classic, .happyHour],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "22212121-2221-2221-2221-222121212121")!,
            name: "Dry Martini",
            description: "Seco, clássico e sofisticado.",
            imageName: "dry_martini",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 60, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gin e gelo em um mixing glass.",
                "Mexa até resfriar bem.",
                "Coe para uma taça martini.",
                "Finalize com limão ou azeitona."
            ],
            alcoholicLevel: .high,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .martini,
                glass: .martini,
                origin: "Estados Unidos",
                year: "Final do século XIX",
                garnish: "Limão ou azeitona",
                flavorProfile: [.dry, .strong],
                tags: [.iba, .classic, .dinner],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "23232323-2323-2323-2323-232323232323")!,
            name: "Daiquiri",
            description: "Cítrico, simples e perfeitamente equilibrado.",
            imageName: "daiquiri",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 20, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione rum, limão e xarope na coqueteleira.",
                "Bata bem com gelo.",
                "Coe para uma taça gelada.",
                "Sirva imediatamente."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .sour,
                glass: .coupe,
                origin: "Cuba",
                year: "1890s",
                garnish: "Limão",
                flavorProfile: [.sour, .refreshing, .sweet],
                tags: [.iba, .classic, .summer],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "24242424-2424-2424-2424-242424242424")!,
            name: "Margarita",
            description: "Cítrica, salgada e marcante.",
            imageName: "margarita",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione tequila e limão na coqueteleira.",
                "Bata bem com gelo.",
                "Coe para uma taça.",
                "Sirva com borda de sal, se desejar."
            ],
            alcoholicLevel: .high,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .sour,
                glass: .coupe,
                origin: "México",
                year: "1930s",
                garnish: "Sal e limão",
                flavorProfile: [.sour, .refreshing, .strong],
                tags: [.iba, .classic, .summer],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "25252525-2525-2525-2525-252525252525")!,
            name: "Cosmopolitan",
            description: "Frutado, cítrico e moderno.",
            imageName: "cosmopolitan",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 45, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Grenadine", amount: 10, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione vodka, limão e grenadine na coqueteleira.",
                "Bata bem com gelo.",
                "Coe para uma taça martini.",
                "Finalize com casca de limão."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .martini,
                glass: .martini,
                origin: "Estados Unidos",
                year: "1980s",
                garnish: "Casca de limão",
                flavorProfile: [.fruity, .sour, .sweet],
                tags: [.iba, .classic, .happyHour],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "26262626-2626-2626-2626-262626262626")!,
            name: "Tom Collins",
            description: "Refrescante, cítrico e leve.",
            imageName: "tom_collins",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 20, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gin, limão e xarope em um copo alto.",
                "Complete com gelo.",
                "Adicione água com gás.",
                "Misture suavemente."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .collins,
                origin: "Estados Unidos",
                year: "1870s",
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour, .sweet],
                tags: [.iba, .classic, .summer],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "27272727-2727-2727-2727-272727272727")!,
            name: "Old Fashioned",
            description: "Intenso, aromático e atemporal.",
            imageName: "old_fashioned",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 60, unit: .ml),
                DrinkIngredient(name: "Açúcar", amount: 1, unit: .piece),
                DrinkIngredient(name: "Laranja", amount: 1, unit: .piece),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Dissolva o açúcar no copo.",
                "Adicione whisky e gelo.",
                "Misture lentamente.",
                "Finalize com laranja."
            ],
            alcoholicLevel: .high,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1800s",
                garnish: "Casca de laranja",
                flavorProfile: [.strong, .bitter, .dry],
                tags: [.iba, .classic, .dinner],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "28282828-2828-2828-2828-282828282828")!,
            name: "Manhattan",
            description: "Clássico, intenso e elegante.",
            imageName: "manhattan",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 60, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione whisky e gelo em um mixing glass.",
                "Mexa até resfriar.",
                "Coe para uma taça.",
                "Finalize com laranja, se desejar."
            ],
            alcoholicLevel: .high,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "Final do século XIX",
                garnish: "Laranja",
                flavorProfile: [.strong, .dry, .bitter],
                tags: [.iba, .classic, .dinner],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "29292929-2929-2929-2929-292929292929")!,
            name: "Paloma",
            description: "Refrescante, cítrica e vibrante.",
            imageName: "paloma",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo em um copo alto.",
                "Coloque tequila e limão.",
                "Complete com água com gás.",
                "Misture suavemente."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "México",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour, .fruity],
                tags: [.classic, .easy, .summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "30303030-3030-3030-3030-303030303030")!,
            name: "White Russian",
            description: "Cremoso, doce e encorpado.",
            imageName: "white_russian",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo em um copo baixo.",
                "Coloque vodka.",
                "Misture suavemente.",
                "Sirva bem gelado."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .dessert,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1940s",
                garnish: nil,
                flavorProfile: [.sweet, .creamy],
                tags: [.classic, .dinner],
                isIBA: false,
                isClassic: true
            )
        ),
        
        Drink(
            id: UUID(uuidString: "31313131-3131-3131-3131-313131313131")!,
            name: "French 75",
            description: "Elegante, cítrico e refrescante.",
            imageName: "french75",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 40, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Água com gás", amount: 100, unit: .ml)
            ],
            instructions: [
                "Misture gin e limão.",
                "Adicione gelo.",
                "Complete com água com gás.",
                "Sirva bem gelado."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .flute,
                origin: "França",
                year: "1910s",
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour, .dry],
                tags: [.iba, .classic, .happyHour],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "32323232-3232-3232-3232-323232323232")!,
            name: "Boulevardier",
            description: "Complexo, intenso e levemente amargo.",
            imageName: "boulevardier",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 45, unit: .ml),
                DrinkIngredient(name: "Aperol", amount: 30, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo.",
                "Coloque whisky.",
                "Adicione Aperol.",
                "Misture suavemente."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .rocks,
                origin: "França",
                year: "1920s",
                garnish: "Laranja",
                flavorProfile: [.bitter, .strong, .dry],
                tags: [.classic, .dinner, .happyHour],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "33313131-3131-3131-3131-313131313131")!,
            name: "Black Russian",
            description: "Forte, seco e direto.",
            imageName: "black_russian",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo.",
                "Coloque a vodka.",
                "Misture.",
                "Sirva."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .rocks,
                origin: "Bélgica",
                year: "1940s",
                garnish: nil,
                flavorProfile: [.strong, .dry],
                tags: [.classic, .easy, .dinner],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "34343434-3434-3434-3434-343434343434")!,
            name: "Dark 'n' Stormy",
            description: "Picante e refrescante.",
            imageName: "dark_stormy",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Ginger Beer", amount: 120, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo.",
                "Coloque rum.",
                "Complete com ginger beer.",
                "Finalize com limão."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Bermudas",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.spicy, .refreshing, .sour],
                tags: [.classic, .easy, .summer],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "35353535-3535-3535-3535-353535353535")!,
            name: "Sea Breeze",
            description: "Frutado e refrescante.",
            imageName: "sea_breeze",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 120, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo.",
                "Coloque vodka.",
                "Complete com o suco.",
                "Misture."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1970s",
                garnish: "Laranja",
                flavorProfile: [.fruity, .refreshing, .sour],
                tags: [.classic, .easy, .summer],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "36363636-3636-3636-3636-363636363636")!,
            name: "Sex on the Beach",
            description: "Frutado, doce e tropical.",
            imageName: "sex_on_the_beach",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 40, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 120, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 15, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Adicione gelo.",
                "Mexa suavemente.",
                "Sirva."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1980s",
                garnish: "Laranja",
                flavorProfile: [.fruity, .sweet, .refreshing],
                tags: [.iba, .classic, .party, .summer],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "37373737-3737-3737-3737-373737373737")!,
            name: "Gin Fizz",
            description: "Leve e extremamente refrescante.",
            imageName: "gin_fizz",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml)
            ],
            instructions: [
                "Misture gin e limão.",
                "Adicione gelo.",
                "Complete com água com gás.",
                "Sirva."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .collins,
                origin: "Estados Unidos",
                year: "Final do século XIX",
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour, .dry],
                tags: [.iba, .classic, .summer],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "38383838-3838-3838-3838-383838383838")!,
            name: "Rum Collins",
            description: "Versão com rum do clássico Collins.",
            imageName: "rum_collins",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml)
            ],
            instructions: [
                "Misture rum e limão.",
                "Adicione gelo.",
                "Complete com água com gás.",
                "Sirva."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .collins,
                origin: "Estados Unidos",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour, .sweet],
                tags: [.classic, .easy, .summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "39393939-3939-3939-3939-393939393939")!,
            name: "Orange Gin",
            description: "Leve, cítrico e aromático.",
            imageName: "orange_gin",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 120, unit: .ml),
                DrinkIngredient(name: "Gelo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo.",
                "Coloque gin.",
                "Complete com suco.",
                "Misture."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Laranja",
                flavorProfile: [.fruity, .refreshing, .sour],
                tags: [.easy, .happyHour, .summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "40404040-4040-4040-4040-404040404040")!,
            name: "Summer Breeze",
            description: "Frutado, leve e perfeito para dias quentes.",
            imageName: "summer_breeze",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 40, unit: .ml),
                DrinkIngredient(name: "Morango", amount: 4, unit: .piece),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml)
            ],
            instructions: [
                "Macere os morangos.",
                "Adicione vodka.",
                "Complete com água com gás.",
                "Misture."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .signature,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Morango",
                flavorProfile: [.fruity, .refreshing, .sweet],
                tags: [.easy, .summer, .party],
                isIBA: false,
                isClassic: false
            )
        )
    ]
}
