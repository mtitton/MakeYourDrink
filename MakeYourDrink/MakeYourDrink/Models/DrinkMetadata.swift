//
//  DrinkMetadata.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

struct DrinkMetadata: Hashable {

    let category: DrinkCategory
    let glass: GlassType

    let origin: String
    let year: String?

    let garnish: String?

    let flavorProfile: [Flavor]

    let tags: [DrinkTag]

    let isIBA: Bool
    let isClassic: Bool

    static let `default` = DrinkMetadata(
        category: .classic,
        glass: .rocks,
        origin: "",
        year: nil,
        garnish: nil,
        flavorProfile: [],
        tags: [],
        isIBA: false,
        isClassic: false
    )
}
