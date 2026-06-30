//
//  MocktailDrinks.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum MocktailDrinks {
    static let items: [Drink] = [
        
        Drink(
            id: UUID(uuidString: "F0000001-F000-F000-F000-F00000000001")!,
            name: "Shirley Temple",
            description: "O mocktail mais famoso do mundo.",
            imageName: "shirley_temple",
            ingredients: [
                DrinkIngredient(name: "Refrigerante de Limão", amount: 150, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 20, unit: .ml)
            ],
            instructions: [
                "Adicione gelo ao copo.",
                "Despeje o refrigerante.",
                "Finalize com grenadine."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1930",
                garnish: "Cereja",
                flavorProfile: [.sweet, .refreshing],
                tags: [.kids, .easy],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000002-F000-F000-F000-F00000000002")!,
            name: "Roy Rogers",
            description: "Versão com cola do Shirley Temple.",
            imageName: "roy_rogers",
            ingredients: [
                DrinkIngredient(name: "Refrigerante Cola", amount: 180, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 20, unit: .ml)
            ],
            instructions: [
                "Misture delicadamente sobre gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1940",
                garnish: "Cereja",
                flavorProfile: [.sweet],
                tags: [.kids, .easy],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000003-F000-F000-F000-F00000000003")!,
            name: "Nojito",
            description: "A versão sem álcool do Mojito.",
            imageName: "nojito",
            ingredients: [
                DrinkIngredient(name: "Hortelã", amount: 8, unit: .leaf),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 20, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml)
            ],
            instructions: [
                "Macere levemente a hortelã.",
                "Adicione gelo.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Cuba",
                year: nil,
                garnish: "Hortelã",
                flavorProfile: [.refreshing, .herbal],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000004-F000-F000-F000-F00000000004")!,
            name: "Virgin Piña Colada",
            description: "Abacaxi e coco em uma versão sem álcool.",
            imageName: "virgin_pina_colada",
            ingredients: [
                DrinkIngredient(name: "Suco de Abacaxi", amount: 120, unit: .ml),
                DrinkIngredient(name: "Leite de Coco", amount: 60, unit: .ml)
            ],
            instructions: [
                "Bata tudo com gelo.",
                "Sirva em copo alto."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .hurricane,
                origin: "Porto Rico",
                year: nil,
                garnish: "Abacaxi",
                flavorProfile: [.tropical, .creamy, .sweet],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000005-F000-F000-F000-F00000000005")!,
            name: "Cinderella",
            description: "Mistura tropical de frutas cítricas.",
            imageName: "cinderella",
            ingredients: [
                DrinkIngredient(name: "Suco de Laranja", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .hurricane,
                origin: "Estados Unidos",
                year: "1960",
                garnish: "Laranja",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000006-F000-F000-F000-F00000000006")!,
            name: "Safe Sex on the Beach",
            description: "Versão sem álcool do famoso coquetel.",
            imageName: "safe_sex_on_the_beach",
            ingredients: [
                DrinkIngredient(name: "Suco de Cranberry", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Pêssego", amount: 30, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Estados Unidos",
                year: nil,
                garnish: "Laranja",
                flavorProfile: [.fruity, .sweet],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000007-F000-F000-F000-F00000000007")!,
            name: "Fruit Punch",
            description: "Clássico ponche de frutas sem álcool.",
            imageName: "fruit_punch",
            ingredients: [
                DrinkIngredient(name: "Suco de Laranja", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Cranberry", amount: 60, unit: .ml)
            ],
            instructions: [
                "Misture tudo.",
                "Sirva bem gelado."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Estados Unidos",
                year: nil,
                garnish: "Frutas frescas",
                flavorProfile: [.fruity, .refreshing],
                tags: [.party],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000008-F000-F000-F000-F00000000008")!,
            name: "Sunrise Cooler",
            description: "Refrescante com laranja e grenadine.",
            imageName: "sunrise_cooler",
            ingredients: [
                DrinkIngredient(name: "Suco de Laranja", amount: 120, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 15, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 60, unit: .ml)
            ],
            instructions: [
                "Misture o suco.",
                "Complete com água com gás.",
                "Finalize com grenadine."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Laranja",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000009-F000-F000-F000-F00000000009")!,
            name: "Apple Fizz",
            description: "Maçã com água com gás, leve e refrescante.",
            imageName: "apple_fizz",
            ingredients: [
                DrinkIngredient(name: "Suco de Maçã", amount: 120, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 80, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 15, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Fatia de maçã",
                flavorProfile: [.refreshing, .fruity],
                tags: [.easy, .summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000010-F000-F000-F000-F00000000010")!,
            name: "Berry Lemonade",
            description: "Limonada com frutas vermelhas.",
            imageName: "berry_lemonade",
            ingredients: [
                DrinkIngredient(name: "Limonada", amount: 180, unit: .ml),
                DrinkIngredient(name: "Framboesa", amount: 6, unit: .piece),
                DrinkIngredient(name: "Mirtilo", amount: 8, unit: .piece)
            ],
            instructions: [
                "Macere levemente as frutas.",
                "Complete com limonada e gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Frutas vermelhas",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer, .kids],
                isIBA: false,
                isClassic: false
            )
        ),
        
        Drink(
            id: UUID(uuidString: "F0000011-F000-F000-F000-F00000000011")!,
            name: "Virgin Mary",
            description: "A versão sem álcool do Bloody Mary.",
            imageName: "virgin_mary",
            ingredients: [
                DrinkIngredient(name: "Suco de Tomate", amount: 150, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Molho Inglês", amount: 2, unit: .dash),
                DrinkIngredient(name: "Molho de Pimenta", amount: 2, unit: .dash)
            ],
            instructions: [
                "Misture todos os ingredientes com gelo.",
                "Sirva em copo alto."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Estados Unidos",
                year: nil,
                garnish: "Salsão",
                flavorProfile: [.savory, .spicy],
                tags: [.brunch],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000012-F000-F000-F000-F00000000012")!,
            name: "Tropical Breeze",
            description: "Abacaxi, manga e água de coco.",
            imageName: "tropical_breeze",
            ingredients: [
                DrinkIngredient(name: "Suco de Abacaxi", amount: 80, unit: .ml),
                DrinkIngredient(name: "Suco de Manga", amount: 60, unit: .ml),
                DrinkIngredient(name: "Água de Coco", amount: 80, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .hurricane,
                origin: "Autoral",
                year: nil,
                garnish: "Abacaxi",
                flavorProfile: [.tropical, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000013-F000-F000-F000-F00000000013")!,
            name: "Cucumber Cooler",
            description: "Pepino, limão e hortelã extremamente refrescantes.",
            imageName: "cucumber_cooler",
            ingredients: [
                DrinkIngredient(name: "Pepino", amount: 6, unit: .piece),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml),
                DrinkIngredient(name: "Hortelã", amount: 6, unit: .leaf)
            ],
            instructions: [
                "Macere levemente o pepino.",
                "Adicione gelo.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Pepino",
                flavorProfile: [.refreshing, .herbal],
                tags: [.summer, .healthy],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000014-F000-F000-F000-F00000000014")!,
            name: "Watermelon Splash",
            description: "Melancia fresca com limão.",
            imageName: "watermelon_splash",
            ingredients: [
                DrinkIngredient(name: "Suco de Melancia", amount: 150, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Misture tudo.",
                "Sirva bem gelado."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Melancia",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000015-F000-F000-F000-F00000000015")!,
            name: "Mango Mule",
            description: "Inspirado no Moscow Mule, sem álcool.",
            imageName: "mango_mule",
            ingredients: [
                DrinkIngredient(name: "Suco de Manga", amount: 80, unit: .ml),
                DrinkIngredient(name: "Ginger Beer Sem Álcool", amount: 120, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes sobre gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .mug,
                origin: "Autoral",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.spicy, .tropical],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000016-F000-F000-F000-F00000000016")!,
            name: "Pink Lemonade",
            description: "Limonada rosada leve e refrescante.",
            imageName: "pink_lemonade",
            ingredients: [
                DrinkIngredient(name: "Limonada", amount: 180, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 15, unit: .ml)
            ],
            instructions: [
                "Misture delicadamente.",
                "Sirva com bastante gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Estados Unidos",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.sweet, .refreshing],
                tags: [.kids],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000017-F000-F000-F000-F00000000017")!,
            name: "Blue Ocean",
            description: "Mocktail azul vibrante e cítrico.",
            imageName: "blue_ocean",
            ingredients: [
                DrinkIngredient(name: "Blue Curaçao Sem Álcool", amount: 30, unit: .ml),
                DrinkIngredient(name: "Limonada", amount: 150, unit: .ml)
            ],
            instructions: [
                "Misture os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.refreshing, .sweet],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000018-F000-F000-F000-F00000000018")!,
            name: "Kiwi Cooler",
            description: "Kiwi fresco com limão e água com gás.",
            imageName: "kiwi_cooler",
            ingredients: [
                DrinkIngredient(name: "Kiwi", amount: 2, unit: .piece),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml)
            ],
            instructions: [
                "Macere o kiwi.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Kiwi",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000019-F000-F000-F000-F00000000019")!,
            name: "Orange Fizz",
            description: "Laranja fresca com água com gás.",
            imageName: "orange_fizz",
            ingredients: [
                DrinkIngredient(name: "Suco de Laranja", amount: 120, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 80, unit: .ml)
            ],
            instructions: [
                "Misture delicadamente.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Laranja",
                flavorProfile: [.fruity, .refreshing],
                tags: [.easy],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000020-F000-F000-F000-F00000000020")!,
            name: "Strawberry Sparkler",
            description: "Morangos frescos com água com gás.",
            imageName: "strawberry_sparkler",
            ingredients: [
                DrinkIngredient(name: "Morango", amount: 5, unit: .piece),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml)
            ],
            instructions: [
                "Macere os morangos.",
                "Adicione gelo.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Morango",
                flavorProfile: [.fruity, .refreshing, .sweet],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        ),
        
        Drink(
            id: UUID(uuidString: "F0000021-F000-F000-F000-F00000000021")!,
            name: "Pineapple Ginger Splash",
            description: "Abacaxi com gengibre e água com gás.",
            imageName: "pineapple_ginger_splash",
            ingredients: [
                DrinkIngredient(name: "Suco de Abacaxi", amount: 120, unit: .ml),
                DrinkIngredient(name: "Gengibre", amount: 3, unit: .piece),
                DrinkIngredient(name: "Água com gás", amount: 80, unit: .ml)
            ],
            instructions: [
                "Macere levemente o gengibre.",
                "Adicione gelo.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Abacaxi",
                flavorProfile: [.tropical, .refreshing, .spicy],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000022-F000-F000-F000-F00000000022")!,
            name: "Peach Cooler",
            description: "Pêssego fresco com limão.",
            imageName: "peach_cooler",
            ingredients: [
                DrinkIngredient(name: "Suco de Pêssego", amount: 120, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 60, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Pêssego",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000023-F000-F000-F000-F00000000023")!,
            name: "Cranberry Fizz",
            description: "Cranberry com toque cítrico.",
            imageName: "cranberry_fizz",
            ingredients: [
                DrinkIngredient(name: "Suco de Cranberry", amount: 100, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 80, unit: .ml)
            ],
            instructions: [
                "Misture delicadamente.",
                "Sirva com bastante gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour],
                tags: [.easy],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000024-F000-F000-F000-F00000000024")!,
            name: "Mint Citrus",
            description: "Laranja, limão e hortelã.",
            imageName: "mint_citrus",
            ingredients: [
                DrinkIngredient(name: "Suco de Laranja", amount: 80, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Hortelã", amount: 8, unit: .leaf),
                DrinkIngredient(name: "Água com gás", amount: 80, unit: .ml)
            ],
            instructions: [
                "Macere levemente a hortelã.",
                "Misture os demais ingredientes."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Hortelã",
                flavorProfile: [.refreshing, .herbal],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000025-F000-F000-F000-F00000000025")!,
            name: "Passion Cooler",
            description: "Maracujá refrescante com água com gás.",
            imageName: "passion_cooler",
            ingredients: [
                DrinkIngredient(name: "Suco de Maracujá", amount: 100, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 100, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 10, unit: .ml)
            ],
            instructions: [
                "Misture tudo sobre gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Brasil",
                year: nil,
                garnish: "Maracujá",
                flavorProfile: [.tropical, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000026-F000-F000-F000-F00000000026")!,
            name: "Virgin Mule",
            description: "Inspirado no Moscow Mule, totalmente sem álcool.",
            imageName: "virgin_mule",
            ingredients: [
                DrinkIngredient(name: "Ginger Beer Sem Álcool", amount: 180, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Misture sobre gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .mug,
                origin: "Estados Unidos",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.spicy, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000027-F000-F000-F000-F00000000027")!,
            name: "Cherry Limeade",
            description: "Cereja e limão em um clássico americano.",
            imageName: "cherry_limeade",
            ingredients: [
                DrinkIngredient(name: "Suco de Cereja", amount: 90, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 80, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Estados Unidos",
                year: nil,
                garnish: "Cereja",
                flavorProfile: [.fruity, .refreshing],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000028-F000-F000-F000-F00000000028")!,
            name: "Coconut Lime Refresher",
            description: "Água de coco com limão e hortelã.",
            imageName: "coconut_lime_refresher",
            ingredients: [
                DrinkIngredient(name: "Água de Coco", amount: 180, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Hortelã", amount: 6, unit: .leaf)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva gelado."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Brasil",
                year: nil,
                garnish: "Hortelã",
                flavorProfile: [.refreshing, .tropical],
                tags: [.healthy, .summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000029-F000-F000-F000-F00000000029")!,
            name: "Sunset Mango",
            description: "Manga e laranja com visual vibrante.",
            imageName: "sunset_mango",
            ingredients: [
                DrinkIngredient(name: "Suco de Manga", amount: 90, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 90, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 10, unit: .ml)
            ],
            instructions: [
                "Misture os sucos.",
                "Finalize com grenadine."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Laranja",
                flavorProfile: [.tropical, .sweet],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "F0000030-F000-F000-F000-F00000000030")!,
            name: "Lavender Lemonade",
            description: "Limonada floral e extremamente aromática.",
            imageName: "lavender_lemonade",
            ingredients: [
                DrinkIngredient(name: "Limonada", amount: 180, unit: .ml),
                DrinkIngredient(name: "Xarope de Lavanda", amount: 15, unit: .ml)
            ],
            instructions: [
                "Misture bem.",
                "Sirva com bastante gelo."
            ],
            alcoholicLevel: .none,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .mocktail,
                glass: .highball,
                origin: "França",
                year: nil,
                garnish: "Lavanda",
                flavorProfile: [.floral, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        )
    ]
}
