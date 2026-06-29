//
//  GinDrinks.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum GinDrinks {
    static let items: [Drink] = [
        Drink(
            id: UUID(uuidString: "50000001-5000-5000-5000-500000000001")!,
            name: "Aviation",
            description: "Floral, elegante e levemente cítrico.",
            imageName: "aviation",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 45, unit: .ml),
                DrinkIngredient(name: "Licor Maraschino", amount: 15, unit: .ml),
                DrinkIngredient(name: "Crème de Violette", amount: 10, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 15, unit: .ml)
            ],
            instructions: [
                "Adicione todos os ingredientes na coqueteleira.",
                "Bata com gelo.",
                "Coe para uma taça gelada.",
                "Finalize com cereja."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1916",
                garnish: "Cereja",
                flavorProfile: [.floral, .sour],
                tags: [.classic, .iba],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "50000002-5000-5000-5000-500000000002")!,
            name: "Bee's Knees",
            description: "Doce, cítrico e extremamente equilibrado.",
            imageName: "bees_knees",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Mel", amount: 20, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Bata com gelo.",
                "Coe para uma taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1921",
                garnish: "Twist de limão",
                flavorProfile: [.sweet, .sour],
                tags: [.classic, .easy],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "50000003-5000-5000-5000-500000000003")!,
            name: "Bramble",
            description: "Refrescante com frutas vermelhas.",
            imageName: "bramble",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml),
                DrinkIngredient(name: "Licor de Amora", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata gin, limão e xarope.",
                "Sirva sobre gelo triturado.",
                "Finalize com licor de amora."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .modern,
                glass: .rocks,
                origin: "Reino Unido",
                year: "1984",
                garnish: "Amoras",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer],
                isIBA: true,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "50000004-5000-5000-5000-500000000004")!,
            name: "Clover Club",
            description: "Frutado, elegante e sedoso.",
            imageName: "clover_club",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 45, unit: .ml),
                DrinkIngredient(name: "Framboesa", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Clara de Ovo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Faça dry shake.",
                "Adicione gelo.",
                "Bata novamente.",
                "Coe para taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .hard,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1896",
                garnish: "Framboesa",
                flavorProfile: [.fruity, .sweet],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "50000005-5000-5000-5000-500000000005")!,
            name: "Southside",
            description: "Muito refrescante e herbal.",
            imageName: "southside",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Hortelã", amount: 8, unit: .leaf),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml)
            ],
            instructions: [
                "Macere levemente a hortelã.",
                "Adicione os demais ingredientes.",
                "Bata com gelo.",
                "Coe."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1917",
                garnish: "Hortelã",
                flavorProfile: [.refreshing, .herbal],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "50000006-5000-5000-5000-500000000006")!,
            name: "Gin Rickey",
            description: "Seco, cítrico e extremamente refrescante.",
            imageName: "gin_rickey",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml)
            ],
            instructions: [
                "Adicione gelo.",
                "Coloque gin.",
                "Esprema o limão.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1883",
                garnish: "Limão",
                flavorProfile: [.sour, .refreshing],
                tags: [.summer, .easy],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "50000007-5000-5000-5000-500000000007")!,
            name: "Pink Gin",
            description: "Elegante com notas aromáticas.",
            imageName: "pink_gin",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 60, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Misture sobre gelo.",
                "Sirva em taça gelada."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .martini,
                origin: "Reino Unido",
                year: "1870",
                garnish: "Twist de limão",
                flavorProfile: [.bitter, .dry],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "50000008-5000-5000-5000-500000000008")!,
            name: "Army & Navy",
            description: "Amêndoas e cítricos em perfeito equilíbrio.",
            imageName: "army_navy",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Orgeat", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata tudo com gelo.",
                "Coe para taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1948",
                garnish: "Casca de limão",
                flavorProfile: [.nutty, .sour],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "50000009-5000-5000-5000-500000000009")!,
            name: "Gin Buck",
            description: "Refrescante com toque de gengibre.",
            imageName: "gin_buck",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Ginger Beer", amount: 120, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo.",
                "Coloque gin.",
                "Complete com ginger beer."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Reino Unido",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.refreshing, .spicy],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "50000010-5000-5000-5000-500000000010")!,
            name: "Singapore Sling",
            description: "Complexo, tropical e muito aromático.",
            imageName: "singapore_sling",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 30, unit: .ml),
                DrinkIngredient(name: "Licor de Cereja", amount: 15, unit: .ml),
                DrinkIngredient(name: "Bénédictine", amount: 8, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 120, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 10, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Sirva em copo alto com gelo."
            ],
            alcoholicLevel: .medium,
            difficulty: .hard,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .hurricane,
                origin: "Singapura",
                year: "1915",
                garnish: "Abacaxi e cereja",
                flavorProfile: [.fruity, .sweet, .tropical],
                tags: [.iba, .party],
                isIBA: true,
                isClassic: true
            )
        ),
        
        Drink(
            id: UUID(uuidString: "50000011-5000-5000-5000-500000000011")!,
            name: "White Lady",
            description: "Elegante, seca e cítrica.",
            imageName: "white_lady",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 40, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Adicione todos os ingredientes na coqueteleira.",
                "Bata com gelo.",
                "Coe para uma taça gelada."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Reino Unido",
                year: "1919",
                garnish: "Twist de limão",
                flavorProfile: [.sour, .dry],
                tags: [.classic, .iba],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "50000012-5000-5000-5000-500000000012")!,
            name: "Martinez",
            description: "O precursor do Dry Martini.",
            imageName: "martinez",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 45, unit: .ml),
                DrinkIngredient(name: "Vermute Rosso", amount: 45, unit: .ml),
                DrinkIngredient(name: "Licor Maraschino", amount: 5, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
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
                origin: "Estados Unidos",
                year: "1884",
                garnish: "Casca de laranja",
                flavorProfile: [.sweet, .herbal],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "50000013-5000-5000-5000-500000000013")!,
            name: "Last Word",
            description: "Herbal, cítrico e perfeitamente equilibrado.",
            imageName: "last_word",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 22.5, unit: .ml),
                DrinkIngredient(name: "Licor Maraschino", amount: 22.5, unit: .ml),
                DrinkIngredient(name: "Chartreuse Verde", amount: 22.5, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 22.5, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes com gelo.",
                "Coe para uma taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1921",
                garnish: "Cereja",
                flavorProfile: [.herbal, .sour],
                tags: [.classic, .iba],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "50000014-5000-5000-5000-500000000014")!,
            name: "Gin Daisy",
            description: "Levemente doce e muito refrescante.",
            imageName: "gin_daisy",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 10, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 60, unit: .ml)
            ],
            instructions: [
                "Bata gin, limão e grenadine.",
                "Sirva sobre gelo.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1876",
                garnish: "Limão",
                flavorProfile: [.sweet, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "50000015-5000-5000-5000-500000000015")!,
            name: "French Gimlet",
            description: "Versão elegante do clássico Gimlet.",
            imageName: "french_gimlet",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Licor St-Germain", amount: 20, unit: .ml),
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
                origin: "França",
                year: nil,
                garnish: "Flor comestível",
                flavorProfile: [.floral, .sour],
                tags: [.floral],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "50000016-5000-5000-5000-500000000016")!,
            name: "Basil Smash",
            description: "Herbal, fresco e muito aromático.",
            imageName: "basil_smash",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Manjericão", amount: 10, unit: .leaf),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml)
            ],
            instructions: [
                "Macere o manjericão.",
                "Adicione os demais ingredientes.",
                "Bata com gelo.",
                "Coe sobre gelo novo."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .modern,
                glass: .rocks,
                origin: "Alemanha",
                year: "2008",
                garnish: "Manjericão",
                flavorProfile: [.herbal, .refreshing],
                tags: [.summer],
                isIBA: true,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "50000017-5000-5000-5000-500000000017")!,
            name: "Earl Grey Martini",
            description: "Gin infusionado com chá Earl Grey.",
            imageName: "earl_grey_martini",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 15, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml)
            ],
            instructions: [
                "Utilize gin infusionado com Earl Grey.",
                "Bata com gelo.",
                "Coe para taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .signature,
                glass: .martini,
                origin: "Reino Unido",
                year: nil,
                garnish: "Casca de limão",
                flavorProfile: [.floral, .sweet],
                tags: [.signature],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "50000018-5000-5000-5000-500000000018")!,
            name: "Corpse Reviver #2",
            description: "Complexo, cítrico e herbal.",
            imageName: "corpse_reviver_2",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 25, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 25, unit: .ml),
                DrinkIngredient(name: "Vermute Lillet", amount: 25, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça gelada."
            ],
            alcoholicLevel: .medium,
            difficulty: .hard,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Reino Unido",
                year: "1930",
                garnish: "Casca de laranja",
                flavorProfile: [.sour, .herbal],
                tags: [.classic, .iba],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "50000019-5000-5000-5000-500000000019")!,
            name: "Ramos Gin Fizz",
            description: "Cremoso, cítrico e extremamente leve.",
            imageName: "ramos_gin_fizz",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 45, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 15, unit: .ml),
                DrinkIngredient(name: "Suco de Limão Siciliano", amount: 15, unit: .ml),
                DrinkIngredient(name: "Creme de Leite", amount: 30, unit: .ml),
                DrinkIngredient(name: "Clara de Ovo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Faça dry shake.",
                "Adicione gelo.",
                "Bata novamente.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .low,
            difficulty: .hard,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1888",
                garnish: "Nenhum",
                flavorProfile: [.creamy, .sour],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "50000020-5000-5000-5000-500000000020")!,
            name: "Orange Gin",
            description: "Refrescante, cítrico e perfeito para o verão.",
            imageName: "orange_gin",
            ingredients: [
                DrinkIngredient(name: "Gin", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 120, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 50, unit: .ml)
            ],
            instructions: [
                "Adicione gelo.",
                "Misture gin e suco.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .signature,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Fatia de laranja",
                flavorProfile: [.sour, .refreshing, .fruity],
                tags: [.easy, .summer, .party],
                isIBA: false,
                isClassic: false
            )
        )
    ]
}
