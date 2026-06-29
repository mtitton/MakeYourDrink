//
//  VodkaDrinks.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum VodkaDrinks {
    static let items: [Drink] = [
        Drink(
            id: UUID(uuidString: "60000001-6000-6000-6000-600000000001")!,
            name: "Bloody Mary",
            description: "Clássico salgado e picante, perfeito para brunch.",
            imageName: "bloody_mary",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Tomate", amount: 120, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 15, unit: .ml),
                DrinkIngredient(name: "Molho Inglês", amount: 2, unit: .dash),
                DrinkIngredient(name: "Molho de Pimenta", amount: 2, unit: .dash)
            ],
            instructions: [
                "Misture todos os ingredientes com gelo.",
                "Mexa delicadamente.",
                "Sirva em copo alto."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .highball,
                origin: "França",
                year: "1921",
                garnish: "Salsão",
                flavorProfile: [.savory, .spicy],
                tags: [.classic, .iba],
                isIBA: true,
                isClassic: true
            )
        ),
        
        Drink(
            id: UUID(uuidString: "60000002-6000-6000-6000-600000000002")!,
            name: "Cape Codder",
            description: "Leve, cítrico e muito refrescante.",
            imageName: "cape_codder",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Cranberry", amount: 120, unit: .ml)
            ],
            instructions: [
                "Adicione gelo.",
                "Coloque vodka.",
                "Complete com cranberry."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer, .easy],
                isIBA: false,
                isClassic: false
            )
        ),
        
        Drink(
            id: UUID(uuidString: "60000003-6000-6000-6000-600000000003")!,
            name: "Screwdriver",
            description: "O clássico de vodka e laranja.",
            imageName: "screwdriver",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 120, unit: .ml)
            ],
            instructions: [
                "Adicione gelo.",
                "Misture vodka e suco."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1949",
                garnish: "Laranja",
                flavorProfile: [.fruity, .sour],
                tags: [.easy, .party],
                isIBA: true,
                isClassic: true
            )
        ),
        
        Drink(
            id: UUID(uuidString: "60000004-6000-6000-6000-600000000004")!,
            name: "Harvey Wallbanger",
            description: "Versão sofisticada do Screwdriver.",
            imageName: "harvey_wallbanger",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 45, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 120, unit: .ml),
                DrinkIngredient(name: "Galliano", amount: 15, unit: .ml)
            ],
            instructions: [
                "Misture vodka e suco.",
                "Finalize com Galliano."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1952",
                garnish: "Laranja",
                flavorProfile: [.sweet, .fruity],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),
        
        Drink(
            id: UUID(uuidString: "60000005-6000-6000-6000-600000000005")!,
            name: "Lemon Drop Martini",
            description: "Doce e cítrico na medida certa.",
            imageName: "lemon_drop_martini",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça açucarada."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .martini,
                glass: .martini,
                origin: "Estados Unidos",
                year: "1970",
                garnish: "Casca de limão",
                flavorProfile: [.sweet, .sour],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        ),
        
        Drink(
            id: UUID(uuidString: "60000006-6000-6000-6000-600000000006")!,
            name: "Espresso Martini",
            description: "Intenso, elegante e perfeito após o jantar.",
            imageName: "espresso_martini",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Licor de Café", amount: 25, unit: .ml),
                DrinkIngredient(name: "Espresso", amount: 30, unit: .ml)
            ],
            instructions: [
                "Bata vigorosamente com gelo.",
                "Coe para taça martini."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .martini,
                glass: .martini,
                origin: "Reino Unido",
                year: "1983",
                garnish: "Grãos de café",
                flavorProfile: [.coffee, .sweet],
                tags: [.iba, .afterDinner],
                isIBA: true,
                isClassic: false
            )
        ),
        
        Drink(
            id: UUID(uuidString: "60000007-6000-6000-6000-600000000007")!,
            name: "Kamikaze",
            description: "Ácido e extremamente refrescante.",
            imageName: "kamikaze",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 40, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .martini,
                origin: "Japão",
                year: "1976",
                garnish: "Limão",
                flavorProfile: [.sour],
                tags: [.party],
                isIBA: true,
                isClassic: true
            )
        ),
        
        Drink(
            id: UUID(uuidString: "60000008-6000-6000-6000-600000000008")!,
            name: "Salty Dog",
            description: "Refrescante com borda de sal.",
            imageName: "salty_dog",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Grapefruit", amount: 120, unit: .ml)
            ],
            instructions: [
                "Passe sal na borda.",
                "Misture os ingredientes sobre gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1950",
                garnish: "Borda de sal",
                flavorProfile: [.sour, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),
        
        Drink(
            id: UUID(uuidString: "60000009-6000-6000-6000-600000000009")!,
            name: "Greyhound",
            description: "Simples, seco e refrescante.",
            imageName: "greyhound",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Grapefruit", amount: 120, unit: .ml)
            ],
            instructions: [
                "Misture tudo com gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1930",
                garnish: "Grapefruit",
                flavorProfile: [.sour, .dry],
                tags: [.easy],
                isIBA: false,
                isClassic: true
            )
        ),
        
        Drink(
            id: UUID(uuidString: "60000010-6000-6000-6000-600000000010")!,
            name: "Bay Breeze",
            description: "Tropical, leve e muito frutado.",
            imageName: "bay_breeze",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Cranberry", amount: 90, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 60, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes sobre gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1980",
                garnish: "Abacaxi",
                flavorProfile: [.fruity, .tropical, .refreshing],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        ),
        
        Drink(
            id: UUID(uuidString: "60000011-6000-6000-6000-600000000011")!,
            name: "Blue Lagoon",
            description: "Refrescante, cítrico e de cor azul vibrante.",
            imageName: "blue_lagoon",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Blue Curaçao", amount: 20, unit: .ml),
                DrinkIngredient(name: "Limonada", amount: 120, unit: .ml)
            ],
            instructions: [
                "Adicione gelo ao copo.",
                "Coloque a vodka e o Blue Curaçao.",
                "Complete com limonada.",
                "Misture suavemente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .signature,
                glass: .highball,
                origin: "França",
                year: "1960",
                garnish: "Rodela de limão",
                flavorProfile: [.sour, .sweet, .refreshing],
                tags: [.summer, .party, .easy],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "60000012-6000-6000-6000-600000000012")!,
            name: "Chi Chi",
            description: "A versão com vodka da Piña Colada.",
            imageName: "chi_chi",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 90, unit: .ml),
                DrinkIngredient(name: "Leite de Coco", amount: 40, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes com gelo.",
                "Sirva em copo alto."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .hurricane,
                origin: "Estados Unidos",
                year: "1970",
                garnish: "Abacaxi",
                flavorProfile: [.tropical, .sweet, .creamy],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "60000013-6000-6000-6000-600000000013")!,
            name: "Vodka Collins",
            description: "Uma versão suave do clássico Collins.",
            imageName: "vodka_collins",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 20, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 100, unit: .ml)
            ],
            instructions: [
                "Misture vodka, limão e xarope.",
                "Adicione gelo.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour],
                tags: [.easy, .summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "60000014-6000-6000-6000-600000000014")!,
            name: "Vodka Gimlet",
            description: "Versão moderna do clássico Gimlet.",
            imageName: "vodka_gimlet",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça gelada."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .martini,
                glass: .martini,
                origin: "Estados Unidos",
                year: nil,
                garnish: "Twist de limão",
                flavorProfile: [.sour, .dry],
                tags: [.easy],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "60000015-6000-6000-6000-600000000015")!,
            name: "Vodka Sunrise",
            description: "Inspirado no Tequila Sunrise.",
            imageName: "vodka_sunrise",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 120, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 15, unit: .ml)
            ],
            instructions: [
                "Misture vodka e suco.",
                "Adicione grenadine lentamente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .signature,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Laranja",
                flavorProfile: [.fruity, .sweet],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "60000016-6000-6000-6000-600000000016")!,
            name: "Apple Martini",
            description: "Doce, frutado e muito popular.",
            imageName: "apple_martini",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 45, unit: .ml),
                DrinkIngredient(name: "Licor de Maçã", amount: 25, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata tudo com gelo.",
                "Coe para taça martini."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .martini,
                glass: .martini,
                origin: "Estados Unidos",
                year: "1996",
                garnish: "Fatia de maçã",
                flavorProfile: [.sweet, .fruity],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "60000017-6000-6000-6000-600000000017")!,
            name: "Pornstar Martini",
            description: "Maracujá, baunilha e muito aroma.",
            imageName: "pornstar_martini",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 50, unit: .ml),
                DrinkIngredient(name: "Maracujá", amount: 1, unit: .piece),
                DrinkIngredient(name: "Licor de Baunilha", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça martini."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .signature,
                glass: .martini,
                origin: "Reino Unido",
                year: "2002",
                garnish: "Meio maracujá",
                flavorProfile: [.tropical, .sweet, .fruity],
                tags: [.party, .modern],
                isIBA: true,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "60000018-6000-6000-6000-600000000018")!,
            name: "Russian Spring Punch",
            description: "Elegante, cítrico e borbulhante.",
            imageName: "russian_spring_punch",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 25, unit: .ml),
                DrinkIngredient(name: "Licor de Cassis", amount: 15, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Espumante", amount: 60, unit: .ml)
            ],
            instructions: [
                "Bata os três primeiros ingredientes.",
                "Complete com espumante."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .highball,
                origin: "Reino Unido",
                year: "1990",
                garnish: "Limão",
                flavorProfile: [.refreshing, .fruity],
                tags: [.iba, .party],
                isIBA: true,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "60000019-6000-6000-6000-600000000019")!,
            name: "French Martini",
            description: "Frutado, sofisticado e sedoso.",
            imageName: "french_martini",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 45, unit: .ml),
                DrinkIngredient(name: "Licor de Framboesa", amount: 15, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 45, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça martini."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .martini,
                glass: .martini,
                origin: "Estados Unidos",
                year: "1980",
                garnish: "Framboesa",
                flavorProfile: [.fruity, .sweet],
                tags: [.party],
                isIBA: true,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "60000020-6000-6000-6000-600000000020")!,
            name: "Woo Woo",
            description: "Leve, doce e perfeito para festas.",
            imageName: "woo_woo",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 40, unit: .ml),
                DrinkIngredient(name: "Licor de Pêssego", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Cranberry", amount: 90, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes com gelo.",
                "Sirva em copo alto."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1988",
                garnish: "Limão",
                flavorProfile: [.sweet, .fruity, .refreshing],
                tags: [.summer, .party, .easy],
                isIBA: true,
                isClassic: false
            )
        )
    ]
}
