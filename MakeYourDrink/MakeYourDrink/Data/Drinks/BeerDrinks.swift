//
//  BeerDrinks.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum BeerDrinks {
    static let items: [Drink] = [
        
        Drink(
            id: UUID(uuidString: "C0000001-C000-C000-C000-C00000000001")!,
            name: "Black & Tan",
            description: "Combinação clássica de lager e stout.",
            imageName: "black_and_tan",
            ingredients: [
                DrinkIngredient(name: "Lager", amount: 150, unit: .ml),
                DrinkIngredient(name: "Stout", amount: 150, unit: .ml)
            ],
            instructions: [
                "Despeje lentamente a lager.",
                "Complete cuidadosamente com a stout utilizando uma colher."
            ],
            alcoholicLevel: .low,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "Reino Unido",
                year: "1889",
                garnish: "Nenhum",
                flavorProfile: [.malty, .dry],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000002-C000-C000-C000-C00000000002")!,
            name: "Snakebite",
            description: "Lager com cidra, muito popular no Reino Unido.",
            imageName: "snakebite",
            ingredients: [
                DrinkIngredient(name: "Lager", amount: 150, unit: .ml),
                DrinkIngredient(name: "Cidra", amount: 150, unit: .ml)
            ],
            instructions: [
                "Misture os ingredientes no copo gelado."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "Reino Unido",
                year: "1980",
                garnish: "Nenhum",
                flavorProfile: [.refreshing, .fruity],
                tags: [.party],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000003-C000-C000-C000-C00000000003")!,
            name: "Diesel",
            description: "Mistura alemã de cerveja com cola.",
            imageName: "diesel",
            ingredients: [
                DrinkIngredient(name: "Lager", amount: 150, unit: .ml),
                DrinkIngredient(name: "Refrigerante Cola", amount: 150, unit: .ml)
            ],
            instructions: [
                "Misture delicadamente os ingredientes."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "Alemanha",
                year: "1970",
                garnish: "Limão",
                flavorProfile: [.sweet, .refreshing],
                tags: [.party],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000004-C000-C000-C000-C00000000004")!,
            name: "Michelada",
            description: "Clássico mexicano picante e refrescante.",
            imageName: "michelada",
            ingredients: [
                DrinkIngredient(name: "Lager", amount: 330, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 30, unit: .ml),
                DrinkIngredient(name: "Molho Inglês", amount: 2, unit: .dash),
                DrinkIngredient(name: "Molho de Pimenta", amount: 2, unit: .dash)
            ],
            instructions: [
                "Passe sal na borda.",
                "Adicione os ingredientes.",
                "Complete com cerveja."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "México",
                year: "1940",
                garnish: "Limão",
                flavorProfile: [.savory, .spicy, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000005-C000-C000-C000-C00000000005")!,
            name: "Chelada",
            description: "A versão simples da Michelada.",
            imageName: "chelada",
            ingredients: [
                DrinkIngredient(name: "Lager", amount: 330, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 30, unit: .ml)
            ],
            instructions: [
                "Passe sal na borda.",
                "Misture com a cerveja."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "México",
                year: "1900",
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour],
                tags: [.summer, .easy],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000006-C000-C000-C000-C00000000006")!,
            name: "Shandy",
            description: "Cerveja clara com limonada.",
            imageName: "shandy",
            ingredients: [
                DrinkIngredient(name: "Lager", amount: 150, unit: .ml),
                DrinkIngredient(name: "Limonada", amount: 150, unit: .ml)
            ],
            instructions: [
                "Misture delicadamente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "Reino Unido",
                year: "1850",
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour],
                tags: [.summer, .easy],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000007-C000-C000-C000-C00000000007")!,
            name: "Radler",
            description: "Tradicional mistura alemã de cerveja e limonada.",
            imageName: "radler",
            ingredients: [
                DrinkIngredient(name: "Lager", amount: 150, unit: .ml),
                DrinkIngredient(name: "Limonada", amount: 150, unit: .ml)
            ],
            instructions: [
                "Misture delicadamente."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "Alemanha",
                year: "1922",
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000008-C000-C000-C000-C00000000008")!,
            name: "Boilermaker",
            description: "Whisky acompanhado de cerveja.",
            imageName: "boilermaker",
            ingredients: [
                DrinkIngredient(name: "Whisky", amount: 45, unit: .ml),
                DrinkIngredient(name: "Lager", amount: 330, unit: .ml)
            ],
            instructions: [
                "Sirva o whisky e a cerveja juntos.",
                "Beba alternando ou despeje o whisky na cerveja."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "Estados Unidos",
                year: "1890",
                garnish: "Nenhum",
                flavorProfile: [.malty, .strong],
                tags: [.afterDinner],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000009-C000-C000-C000-C00000000009")!,
            name: "Irish Car Bomb",
            description: "Drink famoso com stout, whisky irlandês e licor de creme.",
            imageName: "irish_car_bomb",
            ingredients: [
                DrinkIngredient(name: "Stout", amount: 330, unit: .ml),
                DrinkIngredient(name: "Whisky Irlandês", amount: 20, unit: .ml),
                DrinkIngredient(name: "Licor de Creme", amount: 20, unit: .ml)
            ],
            instructions: [
                "Misture whisky e licor.",
                "Despeje rapidamente sobre a stout e beba imediatamente."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "Estados Unidos",
                year: "1979",
                garnish: "Nenhum",
                flavorProfile: [.creamy, .malty],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000010-C000-C000-C000-C00000000010")!,
            name: "Beer Margarita",
            description: "A famosa Beergarita, perfeita para festas.",
            imageName: "beer_margarita",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 45, unit: .ml),
                DrinkIngredient(name: "Lager", amount: 180, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Misture tequila e limão.",
                "Complete com cerveja."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "Estados Unidos",
                year: "1990",
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour],
                tags: [.party, .summer],
                isIBA: false,
                isClassic: false
            )
        ),
        
        Drink(
            id: UUID(uuidString: "C0000011-C000-C000-C000-C00000000011")!,
            name: "Corona Sunrise",
            description: "Cerveja clara com tequila e grenadine.",
            imageName: "corona_sunrise",
            ingredients: [
                DrinkIngredient(name: "Corona", amount: 330, unit: .ml),
                DrinkIngredient(name: "Tequila", amount: 30, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 15, unit: .ml)
            ],
            instructions: [
                "Adicione a tequila na garrafa.",
                "Complete com grenadine."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .bottle,
                origin: "México",
                year: "1995",
                garnish: "Limão",
                flavorProfile: [.sweet, .refreshing],
                tags: [.party, .summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000012-C000-C000-C000-C00000000012")!,
            name: "Lagerita",
            description: "A Margarita servida com cerveja.",
            imageName: "lagerita",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 45, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Lager", amount: 150, unit: .ml)
            ],
            instructions: [
                "Misture tequila, Triple Sec e limão.",
                "Complete com cerveja."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "Estados Unidos",
                year: "2000",
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000013-C000-C000-C000-C00000000013")!,
            name: "Grapefruit Radler",
            description: "Versão cítrica do tradicional Radler.",
            imageName: "grapefruit_radler",
            ingredients: [
                DrinkIngredient(name: "Lager", amount: 180, unit: .ml),
                DrinkIngredient(name: "Suco de Grapefruit", amount: 120, unit: .ml)
            ],
            instructions: [
                "Misture delicadamente.",
                "Sirva bem gelado."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "Alemanha",
                year: "1960",
                garnish: "Grapefruit",
                flavorProfile: [.refreshing, .sour],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000014-C000-C000-C000-C00000000014")!,
            name: "Monaco",
            description: "Clássico francês com cerveja, grenadine e limonada.",
            imageName: "monaco",
            ingredients: [
                DrinkIngredient(name: "Lager", amount: 180, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 15, unit: .ml),
                DrinkIngredient(name: "Limonada", amount: 90, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "França",
                year: "1920",
                garnish: "Limão",
                flavorProfile: [.sweet, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000015-C000-C000-C000-C00000000015")!,
            name: "Bière Picon",
            description: "Cerveja com Amaro Picon, muito popular na França.",
            imageName: "biere_picon",
            ingredients: [
                DrinkIngredient(name: "Lager", amount: 250, unit: .ml),
                DrinkIngredient(name: "Amaro Picon", amount: 30, unit: .ml)
            ],
            instructions: [
                "Adicione o Amaro.",
                "Complete com cerveja."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "França",
                year: "1870",
                garnish: "Laranja",
                flavorProfile: [.bitter, .malty],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000016-C000-C000-C000-C00000000016")!,
            name: "U-Boot",
            description: "Vodka servida diretamente na cerveja.",
            imageName: "u_boot",
            ingredients: [
                DrinkIngredient(name: "Vodka", amount: 40, unit: .ml),
                DrinkIngredient(name: "Lager", amount: 330, unit: .ml)
            ],
            instructions: [
                "Despeje a vodka na cerveja.",
                "Sirva imediatamente."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "Alemanha",
                year: "1950",
                garnish: "Nenhum",
                flavorProfile: [.strong, .malty],
                tags: [.party],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000017-C000-C000-C000-C00000000017")!,
            name: "Red Eye",
            description: "Cerveja com suco de tomate e ovo.",
            imageName: "red_eye",
            ingredients: [
                DrinkIngredient(name: "Lager", amount: 250, unit: .ml),
                DrinkIngredient(name: "Suco de Tomate", amount: 90, unit: .ml),
                DrinkIngredient(name: "Ovo", amount: 1, unit: .piece)
            ],
            instructions: [
                "Misture delicadamente.",
                "Sirva imediatamente."
            ],
            alcoholicLevel: .low,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "Estados Unidos",
                year: "1960",
                garnish: "Pimenta-do-reino",
                flavorProfile: [.savory, .malty],
                tags: [.brunch],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000018-C000-C000-C000-C00000000018")!,
            name: "Apple Beer Cooler",
            description: "Refrescante combinação de cerveja e maçã.",
            imageName: "apple_beer_cooler",
            ingredients: [
                DrinkIngredient(name: "Lager", amount: 180, unit: .ml),
                DrinkIngredient(name: "Suco de Maçã", amount: 90, unit: .ml)
            ],
            instructions: [
                "Misture bem.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "Estados Unidos",
                year: nil,
                garnish: "Fatia de maçã",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000019-C000-C000-C000-C00000000019")!,
            name: "Pineapple Beer Punch",
            description: "Cerveja tropical com abacaxi.",
            imageName: "pineapple_beer_punch",
            ingredients: [
                DrinkIngredient(name: "Lager", amount: 180, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 90, unit: .ml),
                DrinkIngredient(name: "Rum", amount: 20, unit: .ml)
            ],
            instructions: [
                "Misture tudo.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .pint,
                origin: "Caribe",
                year: nil,
                garnish: "Abacaxi",
                flavorProfile: [.tropical, .refreshing],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "C0000020-C000-C000-C000-C00000000020")!,
            name: "Mexican Bulldog Margarita",
            description: "Frozen Margarita servida com uma garrafa de cerveja invertida.",
            imageName: "mexican_bulldog_margarita",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 45, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Corona", amount: 330, unit: .ml)
            ],
            instructions: [
                "Prepare uma Margarita.",
                "Sirva no copo.",
                "Coloque a garrafa de cerveja invertida."
            ],
            alcoholicLevel: .high,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .beer,
                glass: .margarita,
                origin: "México",
                year: "2005",
                garnish: "Limão",
                flavorProfile: [.sour, .refreshing],
                tags: [.party, .summer],
                isIBA: false,
                isClassic: false
            )
        )
    ]
}
