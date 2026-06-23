//
//  UserPreferences.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

struct UserPreferences: Codable {
    var favoriteBases: [String] = []
    var favoriteFlavors: [String] = []
    var preferredAlcoholLevel: AlcoholicLevelPreference = .medium
}

enum AlcoholicLevelPreference: String, Codable, CaseIterable, Identifiable {
    case low = "Leve"
    case medium = "Médio"
    case high = "Forte"

    var id: String { rawValue }
}
