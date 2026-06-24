//
//  DrinkRating.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import Foundation

struct DrinkRating: Identifiable, Codable, Hashable {
    let id: UUID
    let drinkID: UUID
    let rating: Int
    let ratedAt: Date

    init(
        id: UUID = UUID(),
        drinkID: UUID,
        rating: Int,
        ratedAt: Date = Date()
    ) {
        self.id = id
        self.drinkID = drinkID
        self.rating = rating
        self.ratedAt = ratedAt
    }
}
