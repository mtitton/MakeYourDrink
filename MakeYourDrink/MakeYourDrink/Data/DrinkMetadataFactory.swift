//
//  DrinkMetadataFactory.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum DrinkMetadataFactory {
    static func metadata(
        for name: String
    ) -> DrinkMetadata {
        switch name {
        case "Gin Tônica":
            return .init(category: .highball, glass: .highball, origin: "Inglaterra", year: nil, garnish: "Limão", flavorProfile: [.refreshing, .bitter, .dry], tags: [.classic, .easy, .happyHour, .summer], isIBA: false, isClassic: true)

        case "Mojito":
            return .init(category: .highball, glass: .highball, origin: "Cuba", year: nil, garnish: "Hortelã e limão", flavorProfile: [.refreshing, .sour, .herbal], tags: [.iba, .classic, .summer], isIBA: true, isClassic: true)

        case "Caipirinha":
            return .init(category: .sour, glass: .rocks, origin: "Brasil", year: nil, garnish: "Limão", flavorProfile: [.sour, .refreshing, .strong], tags: [.iba, .classic, .summer], isIBA: true, isClassic: true)

        case "Moscow Mule":
            return .init(category: .highball, glass: .mug, origin: "Estados Unidos", year: "1940s", garnish: "Limão", flavorProfile: [.refreshing, .spicy, .sour], tags: [.classic, .happyHour], isIBA: true, isClassic: true)

        case "Aperol Spritz":
            return .init(category: .spritz, glass: .wine, origin: "Itália", year: nil, garnish: "Laranja", flavorProfile: [.bitter, .refreshing, .fruity], tags: [.iba, .classic, .happyHour, .summer], isIBA: true, isClassic: true)

        case "Cuba Libre":
            return .init(category: .highball, glass: .highball, origin: "Cuba", year: "1900s", garnish: "Limão", flavorProfile: [.sweet, .refreshing], tags: [.classic, .easy, .party], isIBA: true, isClassic: true)

        case "Whisky Sour":
            return .init(category: .sour, glass: .rocks, origin: "Estados Unidos", year: "1800s", garnish: "Limão", flavorProfile: [.sour, .strong, .sweet], tags: [.iba, .classic, .dinner], isIBA: true, isClassic: true)

        case "Tequila Sunrise":
            return .init(category: .highball, glass: .highball, origin: "Estados Unidos", year: "1970s", garnish: "Laranja", flavorProfile: [.fruity, .sweet, .refreshing], tags: [.iba, .classic, .summer], isIBA: true, isClassic: true)

        default:
            return .default
        }
    }
}
