//
//  ShoppingListItem.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 27/06/26.
//

import Foundation

struct ShoppingListItem: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    var isChecked: Bool

    init(
        id: UUID = UUID(),
        name: String,
        isChecked: Bool = false
    ) {
        self.id = id
        self.name = name
        self.isChecked = isChecked
    }
}
