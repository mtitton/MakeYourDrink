//
//  DrinkHistoryItem.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import Foundation

struct DrinkHistoryItem: Identifiable, Codable, Hashable {
    let id: UUID
    let drinkID: UUID
    let drinkName: String
    let imageName: String
    let preparedAt: Date

    init(
        id: UUID = UUID(),
        drinkID: UUID,
        drinkName: String,
        imageName: String,
        preparedAt: Date = Date()
    ) {
        self.id = id
        self.drinkID = drinkID
        self.drinkName = drinkName
        self.imageName = imageName
        self.preparedAt = preparedAt
    }
}
