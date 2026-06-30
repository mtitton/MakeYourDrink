//
//  RumDrinks.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum RumDrinks {
    static let items: [Drink] = [
        
        Drink(
            id: UUID(uuidString: "70000001-7000-7000-7000-700000000001")!,
            name: "Mai Tai",
            description: "Tropical, cítrico e um dos maiores clássicos do Tiki.",
            imageName: "mai_tai",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 15, unit: .ml),
                DrinkIngredient(name: "Orgeat", amount: 15, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes com gelo.",
                "Sirva sobre gelo novo.",
                "Finalize com hortelã."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1944",
                garnish: "Hortelã e limão",
                flavorProfile: [.tropical, .nutty, .sour],
                tags: [.iba, .party],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000002-7000-7000-7000-700000000002")!,
            name: "Piña Colada",
            description: "Doce, cremosa e tropical.",
            imageName: "pina_colada",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 90, unit: .ml),
                DrinkIngredient(name: "Leite de Coco", amount: 40, unit: .ml)
            ],
            instructions: [
                "Bata tudo com bastante gelo.",
                "Sirva em taça hurricane."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .hurricane,
                origin: "Porto Rico",
                year: "1954",
                garnish: "Abacaxi",
                flavorProfile: [.tropical, .sweet, .creamy],
                tags: [.iba, .summer, .party],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000003-7000-7000-7000-700000000003")!,
            name: "Planter's Punch",
            description: "Frutado, intenso e muito refrescante.",
            imageName: "planters_punch",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 40, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 15, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes.",
                "Sirva sobre bastante gelo."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .hurricane,
                origin: "Jamaica",
                year: "1878",
                garnish: "Laranja",
                flavorProfile: [.fruity, .sweet],
                tags: [.classic, .summer],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000004-7000-7000-7000-700000000004")!,
            name: "Hurricane",
            description: "Muito tropical e cheio de frutas.",
            imageName: "hurricane",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Maracujá", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 40, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata tudo com gelo.",
                "Sirva em taça hurricane."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .hurricane,
                origin: "Estados Unidos",
                year: "1940",
                garnish: "Laranja",
                flavorProfile: [.tropical, .fruity],
                tags: [.party],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000005-7000-7000-7000-700000000005")!,
            name: "El Presidente",
            description: "Elegante, seco e levemente adocicado.",
            imageName: "el_presidente",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 45, unit: .ml),
                DrinkIngredient(name: "Vermute Branco", amount: 25, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 10, unit: .ml)
            ],
            instructions: [
                "Misture todos os ingredientes com gelo.",
                "Coe para taça gelada."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .martini,
                origin: "Cuba",
                year: "1920",
                garnish: "Casca de laranja",
                flavorProfile: [.dry, .sweet],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000006-7000-7000-7000-700000000006")!,
            name: "Rum Sour",
            description: "Equilibrado entre doce e cítrico.",
            imageName: "rum_sour",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 20, unit: .ml)
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
                origin: "Caribe",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.sour, .sweet],
                tags: [.easy],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000007-7000-7000-7000-700000000007")!,
            name: "Rum Old Fashioned",
            description: "Encorpado e sofisticado.",
            imageName: "rum_old_fashioned",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 60, unit: .ml),
                DrinkIngredient(name: "Açúcar", amount: 1, unit: .piece),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Misture tudo sobre gelo.",
                "Finalize com casca de laranja."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .rocks,
                origin: "Caribe",
                year: nil,
                garnish: "Casca de laranja",
                flavorProfile: [.sweet, .spicy],
                tags: [.afterDinner],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "70000008-7000-7000-7000-700000000008")!,
            name: "Painkiller",
            description: "Cremoso e tropical.",
            imageName: "painkiller",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 90, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 30, unit: .ml),
                DrinkIngredient(name: "Leite de Coco", amount: 40, unit: .ml)
            ],
            instructions: [
                "Bata tudo com gelo.",
                "Sirva em copo alto."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .hurricane,
                origin: "Ilhas Virgens",
                year: "1970",
                garnish: "Noz-moscada",
                flavorProfile: [.tropical, .creamy],
                tags: [.summer],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "70000009-7000-7000-7000-700000000009")!,
            name: "Jungle Bird",
            description: "Amargo, tropical e muito equilibrado.",
            imageName: "jungle_bird",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 45, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 60, unit: .ml),
                DrinkIngredient(name: "Campari", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata tudo com gelo.",
                "Sirva sobre gelo novo."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .rocks,
                origin: "Malásia",
                year: "1978",
                garnish: "Abacaxi",
                flavorProfile: [.tropical, .bitter],
                tags: [.iba],
                isIBA: true,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "70000010-7000-7000-7000-700000000010")!,
            name: "Rum Swizzle",
            description: "Refrescante, frutado e muito aromático.",
            imageName: "rum_swizzle",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Misture tudo com gelo.",
                "Mexa vigorosamente.",
                "Sirva em copo alto."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Bermudas",
                year: "1930",
                garnish: "Laranja",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),
        
        Drink(
            id: UUID(uuidString: "70000011-7000-7000-7000-700000000011")!,
            name: "Corn 'n Oil",
            description: "Rum escuro com especiarias e toque adocicado.",
            imageName: "corn_n_oil",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 60, unit: .ml),
                DrinkIngredient(name: "Falernum", amount: 15, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 2, unit: .dash)
            ],
            instructions: [
                "Adicione gelo.",
                "Misture os ingredientes.",
                "Finalize com Angostura."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .rocks,
                origin: "Barbados",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.spicy, .sweet],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000012-7000-7000-7000-700000000012")!,
            name: "Hotel Nacional",
            description: "Rum, abacaxi e damasco em perfeita harmonia.",
            imageName: "hotel_nacional",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 40, unit: .ml),
                DrinkIngredient(name: "Licor de Damasco", amount: 15, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .coupe,
                origin: "Cuba",
                year: "1931",
                garnish: "Abacaxi",
                flavorProfile: [.tropical, .fruity],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000013-7000-7000-7000-700000000013")!,
            name: "Navy Grog",
            description: "Complexo, cítrico e muito refrescante.",
            imageName: "navy_grog",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Grapefruit", amount: 20, unit: .ml),
                DrinkIngredient(name: "Mel", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Sirva sobre gelo."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "1941",
                garnish: "Hortelã",
                flavorProfile: [.sour, .refreshing],
                tags: [.tiki],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000014-7000-7000-7000-700000000014")!,
            name: "Three Dots and a Dash",
            description: "Tiki clássico rico em sabores.",
            imageName: "three_dots_dash",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 30, unit: .ml),
                DrinkIngredient(name: "Mel", amount: 15, unit: .ml),
                DrinkIngredient(name: "Falernum", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Sirva sobre gelo triturado."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .highball,
                origin: "Estados Unidos",
                year: "1940",
                garnish: "Abacaxi",
                flavorProfile: [.tropical, .sweet],
                tags: [.tiki],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000015-7000-7000-7000-700000000015")!,
            name: "Zombie",
            description: "Forte, tropical e extremamente famoso.",
            imageName: "zombie",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 60, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 40, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 10, unit: .ml)
            ],
            instructions: [
                "Bata tudo com gelo.",
                "Sirva em copo alto."
            ],
            alcoholicLevel: .high,
            difficulty: .hard,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .hurricane,
                origin: "Estados Unidos",
                year: "1934",
                garnish: "Hortelã",
                flavorProfile: [.tropical, .fruity],
                tags: [.party, .tiki],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000016-7000-7000-7000-700000000016")!,
            name: "Rum Flip",
            description: "Cremoso e perfeito para o inverno.",
            imageName: "rum_flip",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Clara de Ovo", amount: 1, unit: .piece),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 15, unit: .ml)
            ],
            instructions: [
                "Faça dry shake.",
                "Adicione gelo.",
                "Bata novamente."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .dessert,
                glass: .coupe,
                origin: "Reino Unido",
                year: nil,
                garnish: "Noz-moscada",
                flavorProfile: [.creamy, .sweet],
                tags: [.afterDinner],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000017-7000-7000-7000-700000000017")!,
            name: "Rum Cobbler",
            description: "Frutado e extremamente refrescante.",
            imageName: "rum_cobbler",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Laranja", amount: 40, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 10, unit: .ml)
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
                year: "1860",
                garnish: "Laranja",
                flavorProfile: [.fruity, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000018-7000-7000-7000-700000000018")!,
            name: "Rum Runner",
            description: "Doce, tropical e muito popular.",
            imageName: "rum_runner",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Licor de Banana", amount: 20, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 60, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 10, unit: .ml)
            ],
            instructions: [
                "Misture tudo com gelo.",
                "Sirva em copo alto."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .hurricane,
                origin: "Estados Unidos",
                year: "1972",
                garnish: "Banana",
                flavorProfile: [.tropical, .sweet],
                tags: [.party],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "70000019-7000-7000-7000-700000000019")!,
            name: "Yellow Bird",
            description: "Rum com notas cítricas e tropicais.",
            imageName: "yellow_bird",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 30, unit: .ml),
                DrinkIngredient(name: "Galliano", amount: 15, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 15, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes.",
                "Coe para taça."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .coupe,
                origin: "Jamaica",
                year: "1960",
                garnish: "Limão",
                flavorProfile: [.sour, .sweet],
                tags: [.iba],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000020-7000-7000-7000-700000000020")!,
            name: "Bushwacker",
            description: "Sobremesa alcoólica cremosa e chocolatuda.",
            imageName: "bushwacker",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 45, unit: .ml),
                DrinkIngredient(name: "Licor de Café", amount: 20, unit: .ml),
                DrinkIngredient(name: "Creme de Leite", amount: 40, unit: .ml),
                DrinkIngredient(name: "Leite de Coco", amount: 30, unit: .ml)
            ],
            instructions: [
                "Bata tudo com gelo.",
                "Sirva bem gelado."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .dessert,
                glass: .hurricane,
                origin: "Estados Unidos",
                year: "1975",
                garnish: "Chocolate ralado",
                flavorProfile: [.creamy, .coffee, .sweet],
                tags: [.afterDinner, .party],
                isIBA: false,
                isClassic: false
            )
        ),
        
        Drink(
            id: UUID(uuidString: "70000021-7000-7000-7000-700000000021")!,
            name: "Mary Pickford",
            description: "Doce, frutado e um clássico cubano.",
            imageName: "mary_pickford",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 45, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 45, unit: .ml),
                DrinkIngredient(name: "Licor Maraschino", amount: 10, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 5, unit: .ml)
            ],
            instructions: [
                "Bata todos os ingredientes com gelo.",
                "Coe para taça gelada."
            ],
            alcoholicLevel: .medium,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .classic,
                glass: .coupe,
                origin: "Cuba",
                year: "1928",
                garnish: "Cereja",
                flavorProfile: [.fruity, .sweet],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000022-7000-7000-7000-700000000022")!,
            name: "Between the Sheets",
            description: "Rum, conhaque e cítricos em equilíbrio.",
            imageName: "between_the_sheets",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 30, unit: .ml),
                DrinkIngredient(name: "Conhaque", amount: 30, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 20, unit: .ml),
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
            id: UUID(uuidString: "70000023-7000-7000-7000-700000000023")!,
            name: "Royal Bermuda Yacht Club",
            description: "Elegante, cítrico e levemente adocicado.",
            imageName: "royal_bermuda_yacht_club",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Falernum", amount: 15, unit: .ml),
                DrinkIngredient(name: "Triple Sec", amount: 10, unit: .ml)
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
                origin: "Bermudas",
                year: "1933",
                garnish: "Limão",
                flavorProfile: [.sour, .spicy],
                tags: [.classic],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000024-7000-7000-7000-700000000024")!,
            name: "Cable Car",
            description: "Versão moderna do Sidecar com rum.",
            imageName: "cable_car",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 45, unit: .ml),
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
                category: .modern,
                glass: .coupe,
                origin: "Estados Unidos",
                year: "1996",
                garnish: "Canela",
                flavorProfile: [.sweet, .sour],
                tags: [.modern],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "70000025-7000-7000-7000-700000000025")!,
            name: "Missionary's Downfall",
            description: "Abacaxi, hortelã e rum em um clássico Tiki.",
            imageName: "missionarys_downfall",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 45, unit: .ml),
                DrinkIngredient(name: "Suco de Abacaxi", amount: 60, unit: .ml),
                DrinkIngredient(name: "Hortelã", amount: 8, unit: .leaf),
                DrinkIngredient(name: "Mel", amount: 15, unit: .ml)
            ],
            instructions: [
                "Bata tudo com gelo.",
                "Sirva em copo alto."
            ],
            alcoholicLevel: .low,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .hurricane,
                origin: "Estados Unidos",
                year: "1948",
                garnish: "Hortelã",
                flavorProfile: [.tropical, .refreshing],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000026-7000-7000-7000-700000000026")!,
            name: "Queen's Park Swizzle",
            description: "Muito refrescante com hortelã e Angostura.",
            imageName: "queens_park_swizzle",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Hortelã", amount: 10, unit: .leaf),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Angostura", amount: 3, unit: .dash)
            ],
            instructions: [
                "Macere levemente a hortelã.",
                "Adicione os demais ingredientes.",
                "Misture com gelo triturado."
            ],
            alcoholicLevel: .medium,
            difficulty: .medium,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Trinidad e Tobago",
                year: "1920",
                garnish: "Hortelã",
                flavorProfile: [.refreshing, .herbal],
                tags: [.classic],
                isIBA: true,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000027-7000-7000-7000-700000000027")!,
            name: "Dr. Funk",
            description: "Tropical e levemente herbal.",
            imageName: "dr_funk",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 20, unit: .ml),
                DrinkIngredient(name: "Grenadine", amount: 10, unit: .ml),
                DrinkIngredient(name: "Água com gás", amount: 80, unit: .ml)
            ],
            instructions: [
                "Misture tudo com gelo.",
                "Complete com água com gás."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .tropical,
                glass: .highball,
                origin: "Polinésia",
                year: "1930",
                garnish: "Hortelã",
                flavorProfile: [.tropical, .refreshing],
                tags: [.summer],
                isIBA: false,
                isClassic: true
            )
        ),

        Drink(
            id: UUID(uuidString: "70000028-7000-7000-7000-700000000028")!,
            name: "Kingston Negroni",
            description: "Versão jamaicana do Negroni usando rum.",
            imageName: "kingston_negroni",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 30, unit: .ml),
                DrinkIngredient(name: "Campari", amount: 30, unit: .ml),
                DrinkIngredient(name: "Vermute Rosso", amount: 30, unit: .ml)
            ],
            instructions: [
                "Misture tudo com gelo.",
                "Sirva em copo baixo."
            ],
            alcoholicLevel: .high,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .modern,
                glass: .rocks,
                origin: "Estados Unidos",
                year: "2009",
                garnish: "Casca de laranja",
                flavorProfile: [.bitter, .spicy],
                tags: [.afterDinner],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "70000029-7000-7000-7000-700000000029")!,
            name: "Kingston Sour",
            description: "Rum envelhecido com perfil cítrico.",
            imageName: "kingston_sour",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Suco de Limão", amount: 25, unit: .ml),
                DrinkIngredient(name: "Xarope de Açúcar", amount: 20, unit: .ml)
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
                origin: "Jamaica",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.sour, .sweet],
                tags: [.easy],
                isIBA: false,
                isClassic: false
            )
        ),

        Drink(
            id: UUID(uuidString: "70000030-7000-7000-7000-700000000030")!,
            name: "Caribbean Mule",
            description: "Rum, gengibre e limão extremamente refrescantes.",
            imageName: "caribbean_mule",
            ingredients: [
                DrinkIngredient(name: "Rum", amount: 50, unit: .ml),
                DrinkIngredient(name: "Ginger Beer", amount: 120, unit: .ml),
                DrinkIngredient(name: "Limão", amount: 1, unit: .piece)
            ],
            instructions: [
                "Adicione gelo.",
                "Coloque o rum.",
                "Complete com ginger beer.",
                "Finalize com limão."
            ],
            alcoholicLevel: .low,
            difficulty: .easy,
            metadata: DrinkMetadata(
                category: .highball,
                glass: .highball,
                origin: "Caribe",
                year: nil,
                garnish: "Limão",
                flavorProfile: [.refreshing, .spicy],
                tags: [.summer, .party],
                isIBA: false,
                isClassic: false
            )
        )
        
    ]
}
