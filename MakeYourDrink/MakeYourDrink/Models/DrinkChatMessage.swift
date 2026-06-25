//
//  DrinkChatMessage.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import Foundation

struct DrinkChatMessage: Identifiable, Codable, Hashable {
    let id: UUID
    let role: DrinkChatRole
    let text: String
    let createdAt: Date

    init(
        id: UUID = UUID(),
        role: DrinkChatRole,
        text: String,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.role = role
        self.text = text
        self.createdAt = createdAt
    }
}

enum DrinkChatRole: String, Codable {
    case user
    case bartender
}
