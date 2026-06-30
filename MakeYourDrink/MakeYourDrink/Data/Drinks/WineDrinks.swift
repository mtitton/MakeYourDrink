//
//  WineDrinks.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum WineDrinks {
    static let items: [Drink] = [
        
        Drink(
            id: UUID(uuidString: "A0000001-A000-A000-A000-A00000000001")!,
            name: "Sangria Tinta",
            description: "O clássico espanhol cheio de frutas frescas.",
            imageName: "sangria_tinta",
            ingredients: [
                DrinkIngredient(name: "Vinho Tinto", amount: 150, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 50, unit: .ml),
                DrinkIngredient(name: "Laranja", amount: 2, unit: .piece),
                DrinkIngredient(name: "Maçã", amount: 2, unit: .piece)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Deixe descansar por alguns minutos.",
                "Sirva com bastante gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .wine,
                origin: "Espanha",
                year: "1800",
                garnish: "Frutas frescas",
                flavorProfile: [.fruity, .refreshing, .sweet],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000002-A000-A000-A000-A00000000002")!,
            name: "Sangria Branca",
            description: "Leve, cítrica e extremamente refrescante.",
            imageName: "sangria_branca",
            ingredients: [
                DrinkIngredient(name: "Vinho Branco", amount: 150, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 30, unit: .ml),
                DrinkIngredient(name: "Maçã Verde", amount: 2, unit: .piece),
                DrinkIngredient(name: "Uva", amount: 6, unit: .piece)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva com bastante gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .wine,
                origin: "Espanha",
                year: nil,
                garnish: "Uvas",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000003-A000-A000-A000-A00000000003")!,
            name: "Sangria Rosé",
            description: "Delicada, frutada e perfeita para o verão.",
            imageName: "sangria_rose",
            ingredients: [
                DrinkIngredient(name: "Vinho Rosé", amount: 150, unit: .ml),
                DrinkIngredient(name: "Morango", amount: 4, unit: .piece),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Misture tudo.",
                "Sirva sobre bastante gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .wine,
                origin: "Espanha",
                year: nil,
                garnish: "Morangos",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000004-A000-A000-A000-A00000000004")!,
            name: "Tinto de Verano",
            description: "O refresco de vinho mais popular da Espanha.",
            imageName: "tinto_de_verano",
            ingredients: [
                DrinkIngredient(name: "Vinho Tinto", amount: 100, unit: .ml),
                DrinkIngredient(name: "Refrigerante Limão", amount: 100, unit: .ml)
            ],
            instructions: [
                "Misture sobre gelo.",
                "Finalize com limão."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .highball,
                origin: "Espanha",
                year: "1920",
                garnish: "Limão",
                flavorProfile: [.refreshing, .fruity],
                tags: [.summer, .easy],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000005-A000-A000-A000-A00000000005")!,
            name: "Kalimotxo",
            description: "Vinho tinto com refrigerante cola.",
            imageName: "kalimotxo",
            ingredients: [
                DrinkIngredient(name: "Vinho Tinto", amount: 100, unit: .ml),
                DrinkIngredient(name: "Refrigerante Cola", amount: 100, unit: .ml)
            ],
            instructions: [
                "Misture ambos sobre gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .highball,
                origin: "Espanha",
                year: "1972",
                garnish: "Limão",
                flavorProfile: [.sweet, .refreshing],
                tags: [.party],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000006-A000-A000-A000-A00000000006")!,
            name: "White Wine Spritzer",
            description: "Leve, seco e muito refrescante.",
            imageName: "white_wine_spritzer",
            ingredients: [
                DrinkIngredient(name: "Vinho Branco", amount: 120, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 60, unit: .ml)
            ],
            instructions: [
                "Sirva sobre gelo.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .wine,
                origin: "Áustria",
                year: "1890",
                garnish: "Limão",
                flavorProfile: [.dry, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000007-A000-A000-A000-A00000000007")!,
            name: "Red Wine Spritzer",
            description: "Versão refrescante com vinho tinto.",
            imageName: "red_wine_spritzer",
            ingredients: [
                DrinkIngredient(name: "Vinho Tinto", amount: 120, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 60, unit: .ml)
            ],
            instructions: [
                "Misture sobre gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .wine,
                origin: "Áustria",
                year: "1890",
                garnish: "Laranja",
                flavorProfile: [.dry, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000008-A000-A000-A000-A00000000008")!,
            name: "Kir",
            description: "Elegante combinação de vinho branco e cassis.",
            imageName: "kir",
            ingredients: [
                DrinkIngredient(name: "Vinho Branco", amount: 90, unit: .ml),
                DrinkIngredient(name: "Licor de Cassis", amount: 10, unit: .ml)
            ],
            instructions: [
                "Adicione o cassis.",
                "Complete com vinho branco."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .wine,
                origin: "França",
                year: "1904",
                garnish: "Nenhum",
                flavorProfile: [.sweet, .fruity],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000009-A000-A000-A000-A00000000009")!,
            name: "Porto Tonic",
            description: "Drink português leve e muito refrescante.",
            imageName: "porto_tonic",
            ingredients: [
                DrinkIngredient(name: "Vinho do Porto Branco", amount: 50, unit: .ml),
                DrinkIngredient(name: "Água Tônica", amount: 120, unit: .ml)
            ],
            instructions: [
                "Adicione gelo.",
                "Misture o vinho do Porto e a tônica."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .highball,
                origin: "Portugal",
                year: "2000",
                garnish: "Limão",
                flavorProfile: [.refreshing, .sweet],
                tags: [.summer, .easy],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000010-A000-A000-A000-A00000000010")!,
            name: "Adonis",
            description: "Clássico elegante com Jerez e vermute.",
            imageName: "adonis",
            ingredients: [
                DrinkIngredient(name: "Jerez Fino", amount: 45, unit: .ml),
                DrinkIngredient(name: "Vermute Seco", amount: 45, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Misture todos os ingredientes com gelo.",
                "Coe para taça gelada."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .martini,
                origin: "Estados Unidos",
                year: "1884",
                garnish: "Casca de laranja",
                flavorProfile: [.dry, .herbal],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),
        
        Drink(
            id: UUID(uuidString: "A0000011-A000-A000-A000-A00000000011")!,
            name: "Bishop",
            description: "Clássico com vinho tinto, rum e frutas cítricas.",
            imageName: "bishop",
            ingredients: [
                DrinkIngredient(name: "Vinho Tinto", amount: 120, unit: .ml),
                DrinkIngredient(name: "Rum", amount: 30, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 30, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 15, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .wine,
                origin: "Reino Unido",
                year: "1800",
                garnish: "Rodela de laranja",
                flavorProfile: [.fruity, .refreshing],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000012-A000-A000-A000-A00000000012")!,
            name: "Claret Cobbler",
            description: "Vinho tinto, frutas cítricas e gelo triturado.",
            imageName: "claret_cobbler",
            ingredients: [
                DrinkIngredient(name: "Vinho Tinto", amount: 120, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml),
                DrinkIngredient(name: "Laranja", amount: 2, unit: .piece)
            ],
            instructions: [
                "Misture tudo.",
                "Sirva sobre gelo triturado."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .wine,
                origin: "Estados Unidos",
                year: "1862",
                garnish: "Laranja",
                flavorProfile: [.fruity, .sweet],
                tags: [.classic, .summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000013-A000-A000-A000-A00000000013")!,
            name: "Mulled Wine",
            description: "Vinho quente aromático com especiarias.",
            imageName: "mulled_wine",
            ingredients: [
                DrinkIngredient(name: "Vinho Tinto", amount: 180, unit: .ml),
                DrinkIngredient(name: "Canela", amount: 1, unit: .piece),
                DrinkIngredient(name: "Cravo", amount: 4, unit: .piece),
                DrinkIngredient(name: "Açúcar", amount: 15, unit: .g)
            ],
            instructions: [
                "Aqueça lentamente todos os ingredientes.",
                "Não deixe ferver.",
                "Sirva quente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .irishCoffee,
                origin: "Alemanha",
                year: "1400",
                garnish: "Canela",
                flavorProfile: [.spicy, .sweet],
                tags: [.winter],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000014-A000-A000-A000-A00000000014")!,
            name: "Glögg",
            description: "Tradicional vinho quente escandinavo.",
            imageName: "glogg",
            ingredients: [
                DrinkIngredient(name: "Vinho Tinto", amount: 180, unit: .ml),
                DrinkIngredient(name: "Canela", amount: 1, unit: .piece),
                DrinkIngredient(name: "Cardamomo", amount: 3, unit: .piece),
                DrinkIngredient(name: "Uvas Passas", amount: 10, unit: .g)
            ],
            instructions: [
                "Aqueça lentamente.",
                "Sirva quente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .irishCoffee,
                origin: "Suécia",
                year: "1600",
                garnish: "Uvas passas",
                flavorProfile: [.spicy, .sweet],
                tags: [.winter],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000015-A000-A000-A000-A00000000015")!,
            name: "Negus",
            description: "Clássico britânico servido quente.",
            imageName: "negus",
            ingredients: [
                DrinkIngredient(name: "Vinho do Porto", amount: 90, unit: .ml),
                DrinkIngredient(name: "Água Quente", amount: 90, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva quente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .irishCoffee,
                origin: "Reino Unido",
                year: "1700",
                garnish: "Casca de limão",
                flavorProfile: [.sweet, .spicy],
                tags: [.winter],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000016-A000-A000-A000-A00000000016")!,
            name: "Frosé",
            description: "Rosé congelado perfeito para o verão.",
            imageName: "frose",
            ingredients: [
                DrinkIngredient(name: "Vinho Rosé", amount: 150, unit: .ml),
                DrinkIngredient(name: "Morango", amount: 4, unit: .piece),
                DrinkIngredient(name: "Suco de Limão", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata tudo com bastante gelo.",
                "Sirva imediatamente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .wine,
                origin: "Estados Unidos",
                year: "2016",
                garnish: "Morango",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000017-A000-A000-A000-A00000000017")!,
            name: "Rosé Lemonade",
            description: "Rosé leve com limonada.",
            imageName: "rose_lemonade",
            ingredients: [
                DrinkIngredient(name: "Vinho Rosé", amount: 120, unit: .ml),
                DrinkIngredient(name: "Limonada", amount: 80, unit: .ml)
            ],
            instructions: [
                "Misture sobre gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .wine,
                origin: "França",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.refreshing, .fruity],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000018-A000-A000-A000-A00000000018")!,
            name: "White Peach Sangria",
            description: "Sangria delicada com vinho branco e pêssego.",
            imageName: "white_peach_sangria",
            ingredients: [
                DrinkIngredient(name: "Vinho Branco", amount: 150, unit: .ml),
                DrinkIngredient(name: "Pêssego", amount: 2, unit: .piece),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva bem gelado."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .wine,
                origin: "Espanha",
                year: nil,
                garnish: "Pêssego",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000019-A000-A000-A000-A00000000019")!,
            name: "Blackberry Wine Smash",
            description: "Vinho tinto com frutas vermelhas e hortelã.",
            imageName: "blackberry_wine_smash",
            ingredients: [
                DrinkIngredient(name: "Vinho Tinto", amount: 120, unit: .ml),
                DrinkIngredient(name: "Amoras", amount: 6, unit: .piece),
                DrinkIngredient(name: "Hortelã", amount: 6, unit: .leaf)
            ],
            instructions: [
                "Macere as amoras.",
                "Misture com o vinho.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .wine,
                origin: "Estados Unidos",
                year: nil,
                garnish: "Amoras",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "A0000020-A000-A000-A000-A00000000020")!,
            name: "Peach Wine Cooler",
            description: "Drink leve com vinho branco e pêssego.",
            imageName: "peach_wine_cooler",
            ingredients: [
                DrinkIngredient(name: "Vinho Branco", amount: 120, unit: .ml),
                DrinkIngredient(name: "Suco de Pêssego", amount: 60, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 40, unit: .ml)
            ],
            instructions: [
                "Misture tudo sobre gelo.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .wine,
                glass: .wine,
                origin: "Estados Unidos",
                year: nil,
                garnish: "Fatia de pêssego",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer, .easy],
                isIBA: false,
                isClassic: false
            )
        ),
        
    ]
}
