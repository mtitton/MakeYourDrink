//
//  LiqueurDrinks.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum LiqueurDrinks {
    static let items: [Drink] = [
        
        Drink(
            id: UUID(uuidString: "E0000001-E000-E000-E000-E00000000001")!,
            name: "Godfather",
            description: "Whisky e Amaretto em perfeita harmonia.",
            imageName: "godfather",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 45, unit: .ml),
                DrinkIngredient(name: "Amaretto", amount: 25, unit: .ml)
            ],
            instructions: [
                "Misture sobre gelo.",
                "Mexa delicadamente."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .afterDinner,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1970",
                garnish: "Casca de laranja",
                flavorProfile: [.nutty, .sweet],
                tags: [.afterDinner],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000002-E000-E000-E000-E00000000002")!,
            name: "Godmother",
            description: "Versão com vodka do clássico Godfather.",
            imageName: "godmother",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 45, unit: .ml),
                DrinkIngredient(name: "Amaretto", amount: 25, unit: .ml)
            ],
            instructions: [
                "Misture sobre gelo."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .afterDinner,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1970",
                garnish: "Nenhum",
                flavorProfile: [.nutty, .sweet],
                tags: [.afterDinner],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000003-E000-E000-E000-E00000000003")!,
            name: "Amaretto Sour",
            description: "Doce, cítrico e muito equilibrado.",
            imageName: "amaretto_sour",
            ingredients: [
                DrinkIngredient(name: "Amaretto", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 30, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 10, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes com gelo.",
                "Coe para copo baixo."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1974",
                garnish: "Cereja",
                flavorProfile: [.sweet, .sour],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000004-E000-E000-E000-E00000000004")!,
            name: "Mudslide",
            description: "Cremoso com café, vodka e licor.",
            imageName: "mudslide",
            ingredients: [
                DrinkIngredient(name: "Licor de Café", amount: 30, unit: .ml),
                DrinkIngredient(name: "Licor Irlandês", amount: 30, unit: .ml),
                DrinkIngredient(name: "Vodka", amount: 30, unit: .ml),
                DrinkIngredient(name: "Creme de Leite", amount: 30, unit: .ml)
            ],
            instructions: [
                "Bata tudo com gelo.",
                "Coe para taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .afterDinner,
                glass: .martini,
                origin: "Estados Unidos",
                year: "1975",
                garnish: "Chocolate ralado",
                flavorProfile: [.coffee, .creamy, .sweet],
                tags: [.afterDinner],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000005-E000-E000-E000-E00000000005")!,
            name: "Colorado Bulldog",
            description: "White Russian finalizado com cola.",
            imageName: "colorado_bulldog",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 30, unit: .ml),
                DrinkIngredient(name: "Licor de Café", amount: 30, unit: .ml),
                DrinkIngredient(name: "Creme de Leite", amount: 30, unit: .ml),
                DrinkIngredient(name: "Refrigerante Cola", amount: 60, unit: .ml)
            ],
            instructions: [
                "Misture os ingredientes.",
                "Complete com cola."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .afterDinner,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1980",
                garnish: "Nenhum",
                flavorProfile: [.coffee, .creamy, .sweet],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000006-E000-E000-E000-E00000000006")!,
            name: "Grasshopper",
            description: "Clássico verde com menta e chocolate.",
            imageName: "grasshopper",
            ingredients: [
                DrinkIngredient(name: "Licor de Hortelã Verde", amount: 30, unit: .ml),
                DrinkIngredient(name: "Licor de Cacau Branco", amount: 30, unit: .ml),
                DrinkIngredient(name: "Creme de Leite", amount: 30, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça gelada."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .afterDinner,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1918",
                garnish: "Chocolate ralado",
                flavorProfile: [.minty, .creamy, .sweet],
                tags: [.afterDinner],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000007-E000-E000-E000-E00000000007")!,
            name: "Golden Cadillac",
            description: "Licor Galliano, cacau e creme.",
            imageName: "golden_cadillac",
            ingredients: [
                DrinkIngredient(name: "Galliano", amount: 30, unit: .ml),
                DrinkIngredient(name: "Licor de Cacau Branco", amount: 30, unit: .ml),
                DrinkIngredient(name: "Creme de Leite", amount: 30, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .afterDinner,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1952",
                garnish: "Chocolate",
                flavorProfile: [.creamy, .sweet],
                tags: [.afterDinner],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000008-E000-E000-E000-E00000000008")!,
            name: "Midori Sour",
            description: "Refrescante com licor de melão.",
            imageName: "midori_sour",
            ingredients: [
                DrinkIngredient(name: "Midori", amount: 45, unit: .ml),
                DrinkIngredient(name: "Vodka", amount: 30, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .modern,
                glass: .rocks,
                origin: "Japão",
                year: "1978",
                garnish: "Melão",
                flavorProfile: [.fruity, .sweet],
                tags: [.party, .summer],
                isIBA: true,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000009-E000-E000-E000-E00000000009")!,
            name: "Japanese Slipper",
            description: "Melão, Triple Sec e limão.",
            imageName: "japanese_slipper",
            ingredients: [
                DrinkIngredient(name: "Midori", amount: 30, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 30, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 30, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .modern,
                glass: .coupe,
                origin: "Austrália",
                year: "1984",
                garnish: "Cereja",
                flavorProfile: [.fruity, .sweet],
                tags: [.party],
                isIBA: true,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000010-E000-E000-E000-E00000000010")!,
            name: "Pink Squirrel",
            description: "Sobremesa líquida com creme e licor de amêndoas.",
            imageName: "pink_squirrel",
            ingredients: [
                DrinkIngredient(name: "Crème de Noyaux", amount: 30, unit: .ml),
                DrinkIngredient(name: "Licor de Cacau Branco", amount: 30, unit: .ml),
                DrinkIngredient(name: "Creme de Leite", amount: 30, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes com gelo.",
                "Coe para taça gelada."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .afterDinner,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1941",
                garnish: "Cereja",
                flavorProfile: [.creamy, .sweet],
                tags: [.afterDinner],
                isIBA: false,
                isClassic: true
            )
        ),
        
        Drink(
            id: UUID(uuidString: "E0000011-E000-E000-E000-E00000000011")!,
            name: "Bijou",
            description: "Elegante combinação de Gin, Chartreuse e Vermute.",
            imageName: "bijou",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 30, unit: .ml),
                DrinkIngredient(name: "Chartreuse Verde", amount: 30, unit: .ml),
                DrinkIngredient(name: "Vermute Rosso", amount: 30, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes com gelo.",
                "Coe para taça gelada."
            ],
            alcoholicLevel: .high,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .martini,
                origin: "França",
                year: "1890",
                garnish: "Cereja",
                flavorProfile: [.herbal, .dry],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000012-E000-E000-E000-E00000000012")!,
            name: "Chartreuse Swizzle",
            description: "Herbal, tropical e extremamente refrescante.",
            imageName: "chartreuse_swizzle",
            ingredients: [
                DrinkIngredient(name: "Chartreuse Verde", amount: 45, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 30, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 45, unit: .ml),
                DrinkIngredient(name: "Falernum", amount: 15, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva sobre gelo triturado."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .highball,
                origin: "Estados Unidos",
                year: "2003",
                garnish: "Hortelã",
                flavorProfile: [.herbal, .tropical],
                tags: [.summer, .iba],
                isIBA: true,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000013-E000-E000-E000-E00000000013")!,
            name: "Green Ghost",
            description: "Seco e intensamente herbal.",
            imageName: "green_ghost",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 45, unit: .ml),
                DrinkIngredient(name: "Chartreuse Verde", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .modern,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1930",
                garnish: "Twist de limão",
                flavorProfile: [.herbal, .sour],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000014-E000-E000-E000-E00000000014")!,
            name: "Monte Cassino",
            description: "Herbal com notas cítricas e de mel.",
            imageName: "monte_cassino",
            ingredients: [
                DrinkIngredient(name: "Whisky Rye", amount: 25, unit: .ml),
                DrinkIngredient(name: "Bénédictine", amount: 25, unit: .ml),
                DrinkIngredient(name: "Chartreuse Amarela", amount: 25, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .modern,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "2005",
                garnish: "Casca de limão",
                flavorProfile: [.herbal, .sour],
                tags: [.modern],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000015-E000-E000-E000-E00000000015")!,
            name: "Banana Banshee",
            description: "Doce, cremoso e perfeito como sobremesa.",
            imageName: "banana_banshee",
            ingredients: [
                DrinkIngredient(name: "Licor de Banana", amount: 30, unit: .ml),
                DrinkIngredient(name: "Licor de Cacau Branco", amount: 30, unit: .ml),
                DrinkIngredient(name: "Creme de Leite", amount: 30, unit: .ml)
            ],
            instructions: [
                "Bata tudo com gelo.",
                "Coe para taça."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .afterDinner,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1970",
                garnish: "Banana",
                flavorProfile: [.banana, .creamy, .sweet],
                tags: [.afterDinner],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000016-E000-E000-E000-E00000000016")!,
            name: "Bocce Ball",
            description: "Amaretto e laranja em um drink leve.",
            imageName: "bocce_ball",
            ingredients: [
                DrinkIngredient(name: "Amaretto", amount: 45, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 120, unit: .ml)
            ],
            instructions: [
                "Misture sobre gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1970",
                garnish: "Laranja",
                flavorProfile: [.fruity, .sweet],
                tags: [.easy, .summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000017-E000-E000-E000-E00000000017")!,
            name: "Italian Sunset",
            description: "Amaretto com frutas tropicais.",
            imageName: "italian_sunset",
            ingredients: [
                DrinkIngredient(name: "Amaretto", amount: 45, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 90, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 15, unit: .ml)
            ],
            instructions: [
                "Misture os ingredientes.",
                "Adicione a grenadine lentamente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .signature,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1980",
                garnish: "Laranja",
                flavorProfile: [.fruity, .sweet],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000018-E000-E000-E000-E00000000018")!,
            name: "Slippery Nipple",
            description: "Shot doce com Sambuca e Baileys.",
            imageName: "slippery_nipple",
            ingredients: [
                DrinkIngredient(name: "Sambuca", amount: 20, unit: .ml),
                DrinkIngredient(name: "Licor Irlandês", amount: 20, unit: .ml)
            ],
            instructions: [
                "Monte cuidadosamente em camadas."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .shot,
                glass: .shot,
                origin: "Estados Unidos",
                year: "1980",
                garnish: "Nenhum",
                flavorProfile: [.sweet, .creamy],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000019-E000-E000-E000-E00000000019")!,
            name: "Baby Guinness",
            description: "Shot que lembra uma mini Guinness.",
            imageName: "baby_guinness",
            ingredients: [
                DrinkIngredient(name: "Licor de Café", amount: 20, unit: .ml),
                DrinkIngredient(name: "Licor Irlandês", amount: 10, unit: .ml)
            ],
            instructions: [
                "Monte cuidadosamente em camadas."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .shot,
                glass: .shot,
                origin: "Irlanda",
                year: "1985",
                garnish: "Nenhum",
                flavorProfile: [.coffee, .creamy],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "E0000020-E000-E000-E000-E00000000020")!,
            name: "Paradise",
            description: "Frutado e delicado com licor de damasco.",
            imageName: "paradise",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 35, unit: .ml),
                DrinkIngredient(name: "Licor de Damasco", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça gelada."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1930",
                garnish: "Casca de laranja",
                flavorProfile: [.fruity, .sweet],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        )
        
    ]
}
