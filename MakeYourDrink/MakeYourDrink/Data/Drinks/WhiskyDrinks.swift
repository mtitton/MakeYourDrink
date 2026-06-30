//
//  WhiskyDrinks.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum WhiskyDrinks {
    static let items: [Drink] = [
        
        Drink(
            id: UUID(uuidString: "80000004-8000-8000-8000-800000000004")!,
            name: "Rusty Nail",
            description: "Whisky e Drambuie em perfeita harmonia.",
            imageName: "rusty_nail",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 45, unit: .ml),
                DrinkIngredient(name: "Drambuie", amount: 25, unit: .ml)
            ],
            instructions: [
                "Misture sobre gelo.",
                "Mexa delicadamente."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .rocks,
                origin: "Reino Unido",
                year: "1960",
                garnish: "Casca de limão",
                flavorProfile: [.sweet, .spicy],
                tags: [.afterDinner],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "80000005-8000-8000-8000-800000000005")!,
            name: "Mint Julep",
            description: "Refrescante e tradicional do Kentucky.",
            imageName: "mint_julep",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 60, unit: .ml),
                DrinkIngredient(name: "Hortelã", amount: 10, unit: .leaf),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml)
            ],
            instructions: [
                "Macere levemente a hortelã.",
                "Adicione gelo triturado.",
                "Complete com whisky."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1803",
                garnish: "Hortelã",
                flavorProfile: [.herbal, .refreshing],
                tags: [.classic, .summer],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "80000006-8000-8000-8000-800000000006")!,
            name: "Penicillin",
            description: "Gengibre, mel e whisky em equilíbrio perfeito.",
            imageName: "penicillin",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 50, unit: .ml),
                DrinkIngredient(name: "Mel", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Gengibre", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .modern,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "2005",
                garnish: "Gengibre cristalizado",
                flavorProfile: [.spicy, .sweet],
                tags: [.modern],
                isIBA: true,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "80000007-8000-8000-8000-800000000007")!,
            name: "Godfather",
            description: "Whisky com o toque adocicado do Amaretto.",
            imageName: "godfather",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 45, unit: .ml),
                DrinkIngredient(name: "Amaretto", amount: 25, unit: .ml)
            ],
            instructions: [
                "Misture tudo sobre gelo."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1972",
                garnish: "Nenhum",
                flavorProfile: [.sweet, .nutty],
                tags: [.afterDinner],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "80000008-8000-8000-8000-800000000008")!,
            name: "Irish Coffee",
            description: "Café quente com whisky irlandês.",
            imageName: "irish_coffee",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 40, unit: .ml),
                DrinkIngredient(name: "Café", amount: 120, unit: .ml),
                DrinkIngredient(name: "Açúcar Mascavo", amount: 2, unit: .piece),
                DrinkIngredient(name: "Creme de Leite", amount: 30, unit: .ml)
            ],
            instructions: [
                "Misture café, açúcar e whisky.",
                "Finalize com creme."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .dessert,
                glass: .irishCoffee,
                origin: "Irlanda",
                year: "1943",
                garnish: "Creme",
                flavorProfile: [.coffee, .creamy, .sweet],
                tags: [.afterDinner],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "80000009-8000-8000-8000-800000000009")!,
            name: "Rob Roy",
            description: "A versão escocesa do Manhattan.",
            imageName: "rob_roy",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 50, unit: .ml),
                DrinkIngredient(name: "Vermute Rosso", amount: 25, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Coe para taça."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .martini,
                origin: "Estados Unidos",
                year: "1894",
                garnish: "Cereja",
                flavorProfile: [.dry, .herbal],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "80000010-8000-8000-8000-800000000010")!,
            name: "Gold Rush",
            description: "Mel, limão e bourbon em perfeita harmonia.",
            imageName: "gold_rush",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 50, unit: .ml),
                DrinkIngredient(name: "Mel", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes com gelo.",
                "Sirva em copo baixo."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .modern,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "2000",
                garnish: "Casca de limão",
                flavorProfile: [.sweet, .sour],
                tags: [.modern],
                isIBA: false,
                isClassic: false
            )
        ),
        
        Drink(
            id: UUID(uuidString: "80000001-8000-8000-8000-800000000001")!,
            name: "Paper Plane",
            description: "Moderno, cítrico e perfeitamente equilibrado.",
            imageName: "paper_plane",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 30, unit: .ml),
                DrinkIngredient(name: "Aperol", amount: 30, unit: .ml),
                DrinkIngredient(name: "Amaro", amount: 30, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 30, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes com gelo.",
                "Coe para taça coupe gelada."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .modern,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "2008",
                garnish: "Casca de limão",
                flavorProfile: [.bitter, .sour],
                tags: [.modern, .iba],
                isIBA: true,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "80000002-8000-8000-8000-800000000002")!,
            name: "Whisky Smash",
            description: "Muito refrescante com limão e hortelã.",
            imageName: "whisky_smash",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 60, unit: .ml),
                DrinkIngredient(name: "Hortelã", amount: 8, unit: .leaf),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml)
            ],
            instructions: [
                "Macere levemente a hortelã.",
                "Adicione os demais ingredientes.",
                "Bata com gelo.",
                "Sirva sobre gelo novo."
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
                tags: [.summer, .easy],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "80000003-8000-8000-8000-800000000003")!,
            name: "New York Sour",
            description: "Whisky Sour com elegante camada de vinho tinto.",
            imageName: "new_york_sour",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 20, unit: .ml),
                DrinkIngredient(name: "Vinho Tinto", amount: 20, unit: .ml)
            ],
            instructions: [
                "Bata whisky, limão e xarope.",
                "Sirva sobre gelo.",
                "Finalize lentamente com vinho tinto."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .modern,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1885",
                garnish: "Casca de limão",
                flavorProfile: [.sour, .fruity],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),
        
        Drink(
            id: UUID(uuidString: "80000011-8000-8000-8000-800000000011")!,
            name: "Blood and Sand",
            description: "Equilibrado entre whisky, frutas e vermute.",
            imageName: "blood_and_sand",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 25, unit: .ml),
                DrinkIngredient(name: "Vermute Rosso", amount: 25, unit: .ml),
                DrinkIngredient(name: "Licor de Cereja", amount: 25, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 25, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes com gelo.",
                "Coe para taça gelada."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Reino Unido",
                year: "1930",
                garnish: "Casca de laranja",
                flavorProfile: [.fruity, .sweet],
                tags: [.classic, .iba],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "80000012-8000-8000-8000-800000000012")!,
            name: "Scotch Highball",
            description: "Whisky escocês e água com gás.",
            imageName: "scotch_highball",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 50, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 150, unit: .ml)
            ],
            instructions: [
                "Adicione bastante gelo.",
                "Complete com água com gás.",
                "Misture delicadamente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Japão",
                year: "1950",
                garnish: "Casca de limão",
                flavorProfile: [.dry, .refreshing],
                tags: [.easy],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "80000013-8000-8000-8000-800000000013")!,
            name: "Whisky Ginger",
            description: "Refrescante e muito popular.",
            imageName: "whisky_ginger",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 50, unit: .ml),
                DrinkIngredient(name: "Ginger Ale", amount: 150, unit: .ml)
            ],
            instructions: [
                "Adicione gelo.",
                "Coloque whisky.",
                "Complete com Ginger Ale."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.sweet, .spicy],
                tags: [.easy, .party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "80000014-8000-8000-8000-800000000014")!,
            name: "Lynchburg Lemonade",
            description: "Whisky, limão e refrigerante cítrico.",
            imageName: "lynchburg_lemonade",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 45, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Refrigerante Limão", amount: 100, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1980",
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "80000015-8000-8000-8000-800000000015")!,
            name: "Bourbon Renewal",
            description: "Frutado e levemente amargo.",
            imageName: "bourbon_renewal",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Licor de Cassis", amount: 15, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata tudo com gelo.",
                "Coe sobre gelo novo."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .modern,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "2004",
                garnish: "Limão",
                flavorProfile: [.fruity, .sour],
                tags: [.modern],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "80000016-8000-8000-8000-800000000016")!,
            name: "Brown Derby",
            description: "Whisky com grapefruit e mel.",
            imageName: "brown_derby",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Grapefruit", amount: 30, unit: .ml),
                DrinkIngredient(name: "Mel", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1933",
                garnish: "Grapefruit",
                flavorProfile: [.sour, .sweet],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "80000017-8000-8000-8000-800000000017")!,
            name: "Whisky Cobbler",
            description: "Refrescante com frutas cítricas.",
            imageName: "whisky_cobbler",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 40, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml)
            ],
            instructions: [
                "Misture tudo.",
                "Sirva sobre gelo triturado."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1862",
                garnish: "Laranja",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "80000018-8000-8000-8000-800000000018")!,
            name: "Whisky Lemon",
            description: "Simples, cítrico e extremamente refrescante.",
            imageName: "whisky_lemon",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 50, unit: .ml),
                DrinkIngredient(name: "Limonada", amount: 150, unit: .ml)
            ],
            instructions: [
                "Misture whisky e limonada.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Autoral",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour],
                tags: [.easy, .summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "80000019-8000-8000-8000-800000000019")!,
            name: "Horse's Neck",
            description: "Whisky com ginger ale e limão.",
            imageName: "horses_neck",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 50, unit: .ml),
                DrinkIngredient(name: "Ginger Ale", amount: 150, unit: .ml)
            ],
            instructions: [
                "Sirva sobre bastante gelo.",
                "Complete com Ginger Ale."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1890",
                garnish: "Casca longa de limão",
                flavorProfile: [.spicy, .refreshing],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "80000020-8000-8000-8000-800000000020")!,
            name: "Whisky Rickey",
            description: "Seco, cítrico e muito leve.",
            imageName: "whisky_rickey",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 120, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1895",
                garnish: "Limão",
                flavorProfile: [.dry, .refreshing],
                tags: [.easy],
                isIBA: false,
                isClassic: true
            )
        ),
        
    ]
}
