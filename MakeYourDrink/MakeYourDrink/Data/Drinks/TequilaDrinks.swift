//
//  TequilaDrinks.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum TequilaDrinks {
    static let items: [Drink] = [
        
        Drink(
            id: UUID(uuidString: "90000001-9000-9000-9000-900000000001")!,
            name: "El Diablo",
            description: "Tequila, cassis e gengibre em perfeita harmonia.",
            imageName: "el_diablo",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Licor de Cassis", amount: 15, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Ginger Beer", amount: 90, unit: .ml)
            ],
            instructions: [
                "Adicione gelo.",
                "Misture tequila, cassis e limão.",
                "Complete com Ginger Beer."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1946",
                garnish: "Limão",
                flavorProfile: [.spicy, .fruity, .refreshing],
                tags: [.iba, .party],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "90000002-9000-9000-9000-900000000002")!,
            name: "Matador",
            description: "Abacaxi e tequila em um clássico mexicano.",
            imageName: "matador",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes com gelo.",
                "Coe para taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .coupe,
                origin: "México",
                year: "1970",
                garnish: "Abacaxi",
                flavorProfile: [.tropical, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "90000003-9000-9000-9000-900000000003")!,
            name: "Mexican Mule",
            description: "A versão mexicana do Moscow Mule.",
            imageName: "mexican_mule",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Ginger Beer", amount: 120, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo.",
                "Coloque tequila.",
                "Complete com Ginger Beer."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "México",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.spicy, .refreshing],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "90000004-9000-9000-9000-900000000004")!,
            name: "Tequila Sour",
            description: "Equilibrado entre tequila, limão e açúcar.",
            imageName: "tequila_sour",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 20, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes com gelo.",
                "Coe para taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "México",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.sour, .refreshing],
                tags: [.easy],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "90000005-9000-9000-9000-900000000005")!,
            name: "Tommy's Margarita",
            description: "Versão moderna da Margarita com agave.",
            imageName: "tommys_margarita",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 30, unit: .ml),
                DrinkIngredient(name: "Xarope de Agave", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata tudo com gelo.",
                "Sirva em copo baixo."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .modern,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1990",
                garnish: "Limão",
                flavorProfile: [.sour, .refreshing],
                tags: [.modern],
                isIBA: true,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "90000006-9000-9000-9000-900000000006")!,
            name: "Brave Bull",
            description: "Tequila com licor de café.",
            imageName: "brave_bull",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Licor de Café", amount: 25, unit: .ml)
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
                origin: "México",
                year: "1950",
                garnish: "Nenhum",
                flavorProfile: [.coffee, .sweet],
                tags: [.afterDinner],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "90000007-9000-9000-9000-900000000007")!,
            name: "Siesta",
            description: "Tequila com Campari e grapefruit.",
            imageName: "siesta",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 45, unit: .ml),
                DrinkIngredient(name: "Campari", amount: 15, unit: .ml),
                DrinkIngredient(name: "Suco de Grapefruit", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 15, unit: .ml)
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
                year: "2006",
                garnish: "Grapefruit",
                flavorProfile: [.bitter, .refreshing],
                tags: [.modern],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "90000008-9000-9000-9000-900000000008")!,
            name: "Rosita",
            description: "Parente mexicano do Negroni.",
            imageName: "rosita",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 45, unit: .ml),
                DrinkIngredient(name: "Campari", amount: 15, unit: .ml),
                DrinkIngredient(name: "Vermute Rosso", amount: 15, unit: .ml),
                DrinkIngredient(name: "Vermute Seco", amount: 15, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .high,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .rocks,
                origin: "México",
                year: "1970",
                garnish: "Casca de laranja",
                flavorProfile: [.bitter, .herbal],
                tags: [.afterDinner],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "90000009-9000-9000-9000-900000000009")!,
            name: "Tequila Collins",
            description: "Refrescante e perfeito para dias quentes.",
            imageName: "tequila_collins",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 20, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 100, unit: .ml)
            ],
            instructions: [
                "Misture tequila, limão e xarope.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "México",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour],
                tags: [.summer, .easy],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "90000010-9000-9000-9000-900000000010")!,
            name: "Tequila Old Fashioned",
            description: "Versão mexicana do clássico Old Fashioned.",
            imageName: "tequila_old_fashioned",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 60, unit: .ml),
                DrinkIngredient(name: "Xarope de Agave", amount: 10, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Misture tudo sobre gelo.",
                "Mexa delicadamente."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .modern,
                glass: .rocks,
                origin: "México",
                year: "2010",
                garnish: "Casca de laranja",
                flavorProfile: [.sweet, .spicy],
                tags: [.modern, .afterDinner],
                isIBA: false,
                isClassic: false
            )
        ),
        
        Drink(
            id: UUID(uuidString: "90000011-9000-9000-9000-900000000011")!,
            name: "Batanga",
            description: "Clássico mexicano com tequila e cola.",
            imageName: "batanga",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Refrigerante Cola", amount: 150, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione bastante gelo.",
                "Coloque a tequila.",
                "Complete com refrigerante cola.",
                "Esprema o limão e misture."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "México",
                year: "1961",
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour],
                tags: [.classic, .easy, .party],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "90000012-9000-9000-9000-900000000012")!,
            name: "Cantarito",
            description: "Muito cítrico e extremamente refrescante.",
            imageName: "cantarito",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 40, unit: .ml),
                DrinkIngredient(name: "Suco de Grapefruit", amount: 40, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 60, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva sobre gelo.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "México",
                year: nil,
                garnish: "Laranja",
                flavorProfile: [.refreshing, .sour],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "90000013-9000-9000-9000-900000000013")!,
            name: "Mexican Firing Squad",
            description: "Clássico mexicano com grenadine.",
            imageName: "mexican_firing_squad",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 15, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .rocks,
                origin: "México",
                year: "1937",
                garnish: "Limão",
                flavorProfile: [.sweet, .sour],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "90000014-9000-9000-9000-900000000014")!,
            name: "Juan Collins",
            description: "A versão com tequila do Tom Collins.",
            imageName: "juan_collins",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 20, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 100, unit: .ml)
            ],
            instructions: [
                "Misture tequila, limão e xarope.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "México",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "90000015-9000-9000-9000-900000000015")!,
            name: "Chimayó",
            description: "Maçã, tequila e cassis.",
            imageName: "chimayo",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 45, unit: .ml),
                DrinkIngredient(name: "Suco de Maçã", amount: 60, unit: .ml),
                DrinkIngredient(name: "Licor de Cassis", amount: 15, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata tudo com gelo.",
                "Sirva sobre gelo novo."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .signature,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1965",
                garnish: "Maçã",
                flavorProfile: [.fruity, .sweet],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "90000016-9000-9000-9000-900000000016")!,
            name: "Acapulco",
            description: "Tropical e muito equilibrado.",
            imageName: "acapulco",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 40, unit: .ml),
                DrinkIngredient(name: "Rum", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 80, unit: .ml),
                DrinkIngredient(name: "Suco de Grapefruit", amount: 30, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .hurricane,
                origin: "México",
                year: "1962",
                garnish: "Abacaxi",
                flavorProfile: [.tropical, .fruity],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "90000017-9000-9000-9000-900000000017")!,
            name: "Oaxaca Old Fashioned",
            description: "Tequila e mezcal em um clássico moderno.",
            imageName: "oaxaca_old_fashioned",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 45, unit: .ml),
                DrinkIngredient(name: "Mezcal", amount: 15, unit: .ml),
                DrinkIngredient(name: "Xarope de Agave", amount: 10, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Misture tudo sobre gelo.",
                "Mexa delicadamente."
            ],
            alcoholicLevel: .high,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .modern,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "2007",
                garnish: "Casca de laranja",
                flavorProfile: [.smoky, .sweet],
                tags: [.modern, .afterDinner],
                isIBA: true,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "90000018-9000-9000-9000-900000000018")!,
            name: "Tequila Daisy",
            description: "Um precursor da Margarita.",
            imageName: "tequila_daisy",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 40, unit: .ml)
            ],
            instructions: [
                "Bata os ingredientes.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .highball,
                origin: "México",
                year: "1930",
                garnish: "Limão",
                flavorProfile: [.refreshing, .sour],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "90000019-9000-9000-9000-900000000019")!,
            name: "Tequila Mockingbird",
            description: "Picante e muito aromático.",
            imageName: "tequila_mockingbird",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 50, unit: .ml),
                DrinkIngredient(name: "Melancia", amount: 60, unit: .ml),
                DrinkIngredient(name: "Pimenta Jalapeño", amount: 2, unit: .piece),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml)
            ],
            instructions: [
                "Macere a jalapeño.",
                "Bata todos os ingredientes.",
                "Coe sobre gelo."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .signature,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "2010",
                garnish: "Jalapeño",
                flavorProfile: [.spicy, .refreshing],
                tags: [.modern],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "90000020-9000-9000-9000-900000000020")!,
            name: "Juan Ho Royale",
            description: "Elegante, cítrico e espumante.",
            imageName: "juan_ho_royale",
            ingredients: [
                DrinkIngredient(name: "Tequila", amount: 30, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Espumante", amount: 90, unit: .ml)
            ],
            instructions: [
                "Misture tequila e limão.",
                "Complete com espumante."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .sparkling,
                glass: .flute,
                origin: "Estados Unidos",
                year: "2000",
                garnish: "Limão",
                flavorProfile: [.refreshing, .dry],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        )
        
    ]
}
