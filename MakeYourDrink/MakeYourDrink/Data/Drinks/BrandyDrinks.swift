//
//  BrandyDrinks.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum BrandyDrinks {
    static let items: [Drink] = [
        
        Drink(
            id: UUID(uuidString: "D0000001-D000-D000-D000-D00000000001")!,
            name: "Brandy Alexander",
            description: "Cremoso, elegante e perfeito como sobremesa.",
            imageName: "brandy_alexander",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 30, unit: .ml),
                DrinkIngredient(name: "Licor de Cacau", amount: 30, unit: .ml),
                DrinkIngredient(name: "Creme de Leite", amount: 30, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes com gelo.",
                "Coe para taça gelada."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .afterDinner,
                glass: .coupe,
                origin: "Reino Unido",
                year: "1922",
                garnish: "Noz-moscada",
                flavorProfile: [.creamy, .sweet],
                tags: [.classic, .afterDinner],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000002-D000-D000-D000-D00000000002")!,
            name: "Stinger",
            description: "Brandy e hortelã em um clássico digestivo.",
            imageName: "stinger",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 50, unit: .ml),
                DrinkIngredient(name: "Licor de Hortelã", amount: 20, unit: .ml)
            ],
            instructions: [
                "Misture com gelo.",
                "Coe para taça."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .afterDinner,
                glass: .martini,
                origin: "Estados Unidos",
                year: "1890",
                garnish: "Folha de hortelã",
                flavorProfile: [.minty, .sweet],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000003-D000-D000-D000-D00000000003")!,
            name: "Between the Sheets",
            description: "Brandy, rum e Triple Sec perfeitamente equilibrados.",
            imageName: "between_the_sheets",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 30, unit: .ml),
                DrinkIngredient(name: "Rum Branco", amount: 30, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 30, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça."
            ],
            alcoholicLevel: .high,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "França",
                year: "1930",
                garnish: "Twist de limão",
                flavorProfile: [.sour, .dry],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000004-D000-D000-D000-D00000000004")!,
            name: "Metropolitan",
            description: "Elegante combinação de brandy e vermute.",
            imageName: "metropolitan",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 50, unit: .ml),
                DrinkIngredient(name: "Vermute Rosso", amount: 20, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 10, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Misture todos os ingredientes com gelo.",
                "Coe para taça."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .martini,
                origin: "Estados Unidos",
                year: "1900",
                garnish: "Casca de laranja",
                flavorProfile: [.sweet, .herbal],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000005-D000-D000-D000-D00000000005")!,
            name: "Japanese Cocktail",
            description: "Brandy com orgeat e bitters.",
            imageName: "japanese_cocktail",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 60, unit: .ml),
                DrinkIngredient(name: "Orgeat", amount: 15, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Misture com gelo.",
                "Coe para taça."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1862",
                garnish: "Casca de limão",
                flavorProfile: [.nutty, .sweet],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000006-D000-D000-D000-D00000000006")!,
            name: "Brandy Smash",
            description: "Refrescante com hortelã e limão.",
            imageName: "brandy_smash",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 60, unit: .ml),
                DrinkIngredient(name: "Hortelã", amount: 8, unit: .leaf),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml)
            ],
            instructions: [
                "Macere a hortelã.",
                "Misture os demais ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1887",
                garnish: "Hortelã",
                flavorProfile: [.refreshing, .herbal],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000007-D000-D000-D000-D00000000007")!,
            name: "Brandy Fix",
            description: "Frutado e servido sobre gelo triturado.",
            imageName: "brandy_fix",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata tudo.",
                "Sirva sobre gelo triturado."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1862",
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000008-D000-D000-D000-D00000000008")!,
            name: "Brandy Crusta",
            description: "Um dos coquetéis mais importantes da história.",
            imageName: "brandy_crusta",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 50, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 10, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Maraschino", amount: 10, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Sirva em taça com borda açucarada."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1852",
                garnish: "Casca de limão",
                flavorProfile: [.sour, .sweet],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000009-D000-D000-D000-D00000000009")!,
            name: "Horse's Neck",
            description: "Brandy com ginger ale e casca de limão.",
            imageName: "horses_neck",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 50, unit: .ml),
                DrinkIngredient(name: "Ginger Ale", amount: 120, unit: .ml)
            ],
            instructions: [
                "Adicione gelo.",
                "Complete com ginger ale."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Reino Unido",
                year: "1895",
                garnish: "Casca longa de limão",
                flavorProfile: [.refreshing, .spicy],
                tags: [.summer],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000010-D000-D000-D000-D00000000010")!,
            name: "Chicago Cocktail",
            description: "Brandy, Triple Sec e bitters finalizados com espumante.",
            imageName: "chicago_cocktail",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 45, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 15, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash),
                DrinkIngredient(name: "Espumante", amount: 30, unit: .ml)
            ],
            instructions: [
                "Bata os três primeiros ingredientes.",
                "Coe para taça.",
                "Complete com espumante."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "Estados Unidos",
                year: "1899",
                garnish: "Casca de laranja",
                flavorProfile: [.sour, .dry],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),
        
        Drink(
            id: UUID(uuidString: "D0000011-D000-D000-D000-D00000000011")!,
            name: "Vieux Carré",
            description: "Complexo e elegante, um clássico de New Orleans.",
            imageName: "vieux_carre",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 30, unit: .ml),
                DrinkIngredient(name: "Whisky Rye", amount: 30, unit: .ml),
                DrinkIngredient(name: "Vermute Rosso", amount: 30, unit: .ml),
                DrinkIngredient(name: "Bénédictine", amount: 5, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Misture todos os ingredientes com gelo.",
                "Coe para copo baixo com gelo novo."
            ],
            alcoholicLevel: .high,
            difficulty: .hard,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1938",
                garnish: "Casca de limão",
                flavorProfile: [.herbal, .spicy],
                tags: [.classic, .afterDinner],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000012-D000-D000-D000-D00000000012")!,
            name: "B&B",
            description: "Brandy e Bénédictine em perfeita harmonia.",
            imageName: "b_and_b",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 45, unit: .ml),
                DrinkIngredient(name: "Bénédictine", amount: 25, unit: .ml)
            ],
            instructions: [
                "Misture sobre gelo.",
                "Sirva em copo baixo."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .afterDinner,
                glass: .rocks,
                origin: "França",
                year: "1930",
                garnish: "Nenhum",
                flavorProfile: [.sweet, .herbal],
                tags: [.afterDinner],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000013-D000-D000-D000-D00000000013")!,
            name: "Cognac Highball",
            description: "Leve e refrescante com água com gás.",
            imageName: "cognac_highball",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 50, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml)
            ],
            instructions: [
                "Adicione gelo.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "França",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.refreshing, .dry],
                tags: [.easy, .summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000014-D000-D000-D000-D00000000014")!,
            name: "French Connection",
            description: "Brandy com Amaretto.",
            imageName: "french_connection",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 40, unit: .ml),
                DrinkIngredient(name: "Amaretto", amount: 40, unit: .ml)
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
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000015-D000-D000-D000-D00000000015")!,
            name: "Harvard",
            description: "Brandy e vermute em um clássico americano.",
            imageName: "harvard",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 45, unit: .ml),
                DrinkIngredient(name: "Vermute Rosso", amount: 20, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Misture com gelo.",
                "Coe para taça."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .martini,
                origin: "Estados Unidos",
                year: "1895",
                garnish: "Cereja",
                flavorProfile: [.herbal, .dry],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000016-D000-D000-D000-D00000000016")!,
            name: "Brandy Daisy",
            description: "Refrescante e levemente cítrico.",
            imageName: "brandy_daisy",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 10, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 60, unit: .ml)
            ],
            instructions: [
                "Bata os três primeiros ingredientes.",
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
                flavorProfile: [.refreshing, .sweet],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000017-D000-D000-D000-D00000000017")!,
            name: "East India Cocktail",
            description: "Brandy com abacaxi e bitters.",
            imageName: "east_india_cocktail",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 45, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 20, unit: .ml),
                DrinkIngredient(name: "Licor Maraschino", amount: 10, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Reino Unido",
                year: "1882",
                garnish: "Abacaxi",
                flavorProfile: [.fruity, .sweet],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000018-D000-D000-D000-D00000000018")!,
            name: "Brandy Old Fashioned",
            description: "Versão com brandy do clássico Old Fashioned.",
            imageName: "brandy_old_fashioned",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 60, unit: .ml),
                DrinkIngredient(name: "Açúcar", amount: 1, unit: .piece),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Misture tudo sobre gelo.",
                "Mexa delicadamente."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1893",
                garnish: "Casca de laranja",
                flavorProfile: [.sweet, .spicy],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000019-D000-D000-D000-D00000000019")!,
            name: "Milk Punch",
            description: "Brandy cremoso servido gelado.",
            imageName: "milk_punch",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 45, unit: .ml),
                DrinkIngredient(name: "Leite", amount: 90, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Sirva com gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .afterDinner,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1700",
                garnish: "Noz-moscada",
                flavorProfile: [.creamy, .sweet],
                tags: [.brunch],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "D0000020-D000-D000-D000-D00000000020")!,
            name: "Brandy Cobbler",
            description: "Frutado, leve e servido sobre gelo triturado.",
            imageName: "brandy_cobbler",
            ingredients: [
                DrinkIngredient(name: "Brandy", amount: 60, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml),
                DrinkIngredient(name: "Laranja", amount: 2, unit: .piece)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva sobre gelo triturado."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
           metadata: DrinkMetadata(
                category: .classic,
                glass: .wine,
                origin: "Estados Unidos",
                year: "1838",
                garnish: "Frutas frescas",
                flavorProfile: [.fruity, .refreshing],
                tags: [.classic, .summer],
                isIBA: false,
                isClassic: true
            )
        )
    ]
}
