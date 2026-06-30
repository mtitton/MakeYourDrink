//
//  ChampagneDrinks.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum ChampagneDrinks {
    static let items: [Drink] = [
        
        Drink(
            id: UUID(uuidString: "B0000001-B000-B000-B000-B00000000001")!,
            name: "Mimosa",
            description: "O clássico brunch de espumante e laranja.",
            imageName: "mimosa",
            ingredients: [
                DrinkIngredient(name: "Espumante", amount: 75, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 75, unit: .ml)
            ],
            instructions: [
                "Adicione o suco de laranja.",
                "Complete delicadamente com espumante."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "França",
                year: "1925",
                garnish: "Fatia de laranja",
                flavorProfile: [.fruity, .refreshing],
                tags: [.brunch, .easy],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000002-B000-B000-B000-B00000000002")!,
            name: "Bellini",
            description: "Espumante italiano com purê de pêssego.",
            imageName: "bellini",
            ingredients: [
                DrinkIngredient(name: "Espumante", amount: 100, unit: .ml),
                DrinkIngredient(name: "Purê de Pêssego", amount: 50, unit: .ml)
            ],
            instructions: [
                "Adicione o purê.",
                "Complete com espumante.",
                "Misture suavemente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "Itália",
                year: "1948",
                garnish: "Fatia de pêssego",
                flavorProfile: [.fruity, .sweet],
                tags: [.brunch, .summer],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000003-B000-B000-B000-B00000000003")!,
            name: "Rossini",
            description: "Bellini preparado com morangos frescos.",
            imageName: "rossini",
            ingredients: [
                DrinkIngredient(name: "Espumante", amount: 100, unit: .ml),
                DrinkIngredient(name: "Purê de Morango", amount: 50, unit: .ml)
            ],
            instructions: [
                "Misture delicadamente os ingredientes."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "Itália",
                year: "1950",
                garnish: "Morango",
                flavorProfile: [.fruity, .sweet],
                tags: [.summer, .party],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000004-B000-B000-B000-B00000000004")!,
            name: "Kir Royale",
            description: "Espumante com licor de cassis.",
            imageName: "kir_royale",
            ingredients: [
                DrinkIngredient(name: "Espumante", amount: 90, unit: .ml),
                DrinkIngredient(name: "Licor de Cassis", amount: 10, unit: .ml)
            ],
            instructions: [
                "Adicione o cassis.",
                "Complete com espumante."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "França",
                year: "1945",
                garnish: "Framboesa",
                flavorProfile: [.fruity, .sweet],
                tags: [.classic, .party],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000005-B000-B000-B000-B00000000005")!,
            name: "Champagne Cocktail",
            description: "O clássico absoluto dos coquetéis com Champagne.",
            imageName: "champagne_cocktail",
            ingredients: [
                DrinkIngredient(name: "Espumante", amount: 120, unit: .ml),
                DrinkIngredient(name: "Açúcar", amount: 1, unit: .piece),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Embeba o açúcar com Angostura.",
                "Adicione ao fundo da taça.",
                "Complete com espumante."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "França",
                year: "1862",
                garnish: "Casca de limão",
                flavorProfile: [.dry, .refreshing],
                tags: [.classic, .iba],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000006-B000-B000-B000-B00000000006")!,
            name: "Hugo Spritz",
            description: "Floral, leve e extremamente refrescante.",
            imageName: "hugo_spritz",
            ingredients: [
                DrinkIngredient(name: "Espumante", amount: 90, unit: .ml),
                DrinkIngredient(name: "Licor St-Germain", amount: 30, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 30, unit: .ml)
            ],
            instructions: [
                "Adicione bastante gelo.",
                "Misture delicadamente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .wine,
                origin: "Itália",
                year: "2005",
                garnish: "Hortelã",
                flavorProfile: [.floral, .refreshing],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000007-B000-B000-B000-B00000000007")!,
            name: "Aperol Spritz",
            description: "O drink italiano mais famoso do verão.",
            imageName: "aperol_spritz",
            ingredients: [
                DrinkIngredient(name: "Espumante", amount: 90, unit: .ml),
                DrinkIngredient(name: "Aperol", amount: 60, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 30, unit: .ml)
            ],
            instructions: [
                "Adicione gelo.",
                "Misture delicadamente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .wine,
                origin: "Itália",
                year: "1919",
                garnish: "Fatia de laranja",
                flavorProfile: [.bitter, .refreshing],
                tags: [.iba, .summer, .party],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000008-B000-B000-B000-B00000000008")!,
            name: "Buck's Fizz",
            description: "Versão clássica inglesa da Mimosa.",
            imageName: "bucks_fizz",
            ingredients: [
                DrinkIngredient(name: "Espumante", amount: 100, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 50, unit: .ml)
            ],
            instructions: [
                "Misture delicadamente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "Reino Unido",
                year: "1921",
                garnish: "Laranja",
                flavorProfile: [.fruity, .refreshing],
                tags: [.brunch],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000009-B000-B000-B000-B00000000009")!,
            name: "Black Velvet",
            description: "Champagne com cerveja stout.",
            imageName: "black_velvet",
            ingredients: [
                DrinkIngredient(name: "Espumante", amount: 90, unit: .ml),
                DrinkIngredient(name: "Cerveja Stout", amount: 90, unit: .ml)
            ],
            instructions: [
                "Despeje cuidadosamente os ingredientes na taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "Reino Unido",
                year: "1861",
                garnish: "Nenhum",
                flavorProfile: [.dry, .malty],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000010-B000-B000-B000-B00000000010")!,
            name: "Death in the Afternoon",
            description: "Champagne com absinto criado por Ernest Hemingway.",
            imageName: "death_in_the_afternoon",
            ingredients: [
                DrinkIngredient(name: "Absinto", amount: 30, unit: .ml),
                DrinkIngredient(name: "Espumante", amount: 120, unit: .ml)
            ],
            instructions: [
                "Adicione o absinto.",
                "Complete lentamente com espumante."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "França",
                year: "1935",
                garnish: "Nenhum",
                flavorProfile: [.herbal, .dry],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),
        
        Drink(
            id: UUID(uuidString: "B0000011-B000-B000-B000-B00000000011")!,
            name: "Old Cuban",
            description: "Um Mojito sofisticado finalizado com espumante.",
            imageName: "old_cuban",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 45, unit: .ml),
                DrinkIngredient(name: "Espumante", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 22.5, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml),
                DrinkIngredient(name: "Hortelã", amount: 8, unit: .leaf)
            ],
            instructions: [
                "Bata todos os ingredientes, exceto o espumante.",
                "Coe para uma taça.",
                "Complete com espumante."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "2001",
                garnish: "Hortelã",
                flavorProfile: [.refreshing, .herbal],
                tags: [.modern, .party],
                isIBA: true,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000012-B000-B000-B000-B00000000012")!,
            name: "Air Mail",
            description: "Rum, mel, limão e espumante.",
            imageName: "air_mail",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 45, unit: .ml),
                DrinkIngredient(name: "Mel", amount: 15, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Espumante", amount: 60, unit: .ml)
            ],
            instructions: [
                "Bata os três primeiros ingredientes.",
                "Coe.",
                "Complete com espumante."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "Cuba",
                year: "1941",
                garnish: "Limão",
                flavorProfile: [.sweet, .refreshing],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000013-B000-B000-B000-B00000000013")!,
            name: "Seelbach",
            description: "Elegante combinação de bourbon e Champagne.",
            imageName: "seelbach",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 30, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 15, unit: .ml),
                DrinkIngredient(name: "Espumante", amount: 90, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Misture os ingredientes, exceto o espumante.",
                "Coe.",
                "Complete com espumante."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "Estados Unidos",
                year: "1917",
                garnish: "Casca de laranja",
                flavorProfile: [.dry, .sour],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000014-B000-B000-B000-B00000000014")!,
            name: "French 76",
            description: "Versão do French 75 preparada com vodka.",
            imageName: "french_76",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 30, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml),
                DrinkIngredient(name: "Espumante", amount: 60, unit: .ml)
            ],
            instructions: [
                "Bata os três primeiros ingredientes.",
                "Coe.",
                "Complete com espumante."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "Estados Unidos",
                year: "1980",
                garnish: "Twist de limão",
                flavorProfile: [.refreshing, .sour],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000015-B000-B000-B000-B00000000015")!,
            name: "Puccini",
            description: "Espumante com suco fresco de tangerina.",
            imageName: "puccini",
            ingredients: [
                DrinkIngredient(name: "Espumante", amount: 100, unit: .ml),
                DrinkIngredient(name: "Suco de Tangerina", amount: 40, unit: .ml)
            ],
            instructions: [
                "Misture delicadamente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "Itália",
                year: "1940",
                garnish: "Tangerina",
                flavorProfile: [.fruity, .refreshing],
                tags: [.brunch],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000016-B000-B000-B000-B00000000016")!,
            name: "Tintoretto",
            description: "Espumante italiano com suco de romã.",
            imageName: "tintoretto",
            ingredients: [
                DrinkIngredient(name: "Espumante", amount: 100, unit: .ml),
                DrinkIngredient(name: "Suco de Romã", amount: 40, unit: .ml)
            ],
            instructions: [
                "Misture delicadamente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "Itália",
                year: "1948",
                garnish: "Sementes de romã",
                flavorProfile: [.fruity, .refreshing],
                tags: [.brunch],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000017-B000-B000-B000-B00000000017")!,
            name: "Elderflower Royale",
            description: "Floral e delicado com licor de flor de sabugueiro.",
            imageName: "elderflower_royale",
            ingredients: [
                DrinkIngredient(name: "Espumante", amount: 100, unit: .ml),
                DrinkIngredient(name: "Licor St-Germain", amount: 20, unit: .ml)
            ],
            instructions: [
                "Adicione o licor.",
                "Complete com espumante."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "França",
                year: "2007",
                garnish: "Flor comestível",
                flavorProfile: [.floral, .refreshing],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000018-B000-B000-B000-B00000000018")!,
            name: "Peach Royale",
            description: "Espumante com licor de pêssego.",
            imageName: "peach_royale",
            ingredients: [
                DrinkIngredient(name: "Espumante", amount: 100, unit: .ml),
                DrinkIngredient(name: "Licor de Pêssego", amount: 20, unit: .ml)
            ],
            instructions: [
                "Adicione o licor.",
                "Complete com espumante."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "França",
                year: nil,
                garnish: "Fatia de pêssego",
                flavorProfile: [.fruity, .sweet],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000019-B000-B000-B000-B00000000019")!,
            name: "Sparkling Rosé Punch",
            description: "Leve, frutado e ideal para compartilhar.",
            imageName: "sparkling_rose_punch",
            ingredients: [
                DrinkIngredient(name: "Espumante Rosé", amount: 120, unit: .ml),
                DrinkIngredient(name: "Suco de Cranberry", amount: 40, unit: .ml),
                DrinkIngredient(name: "Morango", amount: 4, unit: .piece)
            ],
            instructions: [
                "Misture delicadamente.",
                "Sirva com bastante gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .wine,
                origin: "Estados Unidos",
                year: nil,
                garnish: "Morangos",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "B0000020-B000-B000-B000-B00000000020")!,
            name: "Champagne Julep",
            description: "Uma versão elegante do Julep com espumante.",
            imageName: "champagne_julep",
            ingredients: [
                DrinkIngredient(name: "Espumante", amount: 120, unit: .ml),
                DrinkIngredient(name: "Hortelã", amount: 8, unit: .leaf),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 10, unit: .ml)
            ],
            instructions: [
                "Macere levemente a hortelã.",
                "Adicione gelo.",
                "Complete com espumante."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .wine,
                origin: "Estados Unidos",
                year: "1895",
                garnish: "Hortelã",
                flavorProfile: [.refreshing, .herbal],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        )
    ]
}
