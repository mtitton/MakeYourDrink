//
//  DrinkWizardRequest.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import Foundation

struct DrinkWizardRequest: Codable, Hashable {
    var mood: DrinkWizardMood?
    var base: DrinkWizardBase?
    var intensity: DrinkWizardIntensity?
    var occasion: DrinkWizardOccasion?
    var servings: Int
    var allowMissingIngredients: Bool

    init(
        mood: DrinkWizardMood? = nil,
        base: DrinkWizardBase? = nil,
        intensity: DrinkWizardIntensity? = nil,
        occasion: DrinkWizardOccasion? = nil,
        servings: Int = 1,
        allowMissingIngredients: Bool = true
    ) {
        self.mood = mood
        self.base = base
        self.intensity = intensity
        self.occasion = occasion
        self.servings = servings
        self.allowMissingIngredients = allowMissingIngredients
    }
}

enum DrinkWizardMood: String, CaseIterable, Identifiable, Codable {
    case refreshing = "Refrescante"
    case sweet = "Doce"
    case citrus = "Cítrico"
    case creamy = "Cremoso"
    case strong = "Forte"

    var id: String { rawValue }
}

enum DrinkWizardBase: String, CaseIterable, Identifiable, Codable {
    case gin = "Gin"
    case vodka = "Vodka"
    case rum = "Rum"
    case whisky = "Whisky"
    case tequila = "Tequila"
    case any = "Tanto faz"

    var id: String { rawValue }
}

enum DrinkWizardIntensity: String, CaseIterable, Identifiable, Codable {
    case light = "Leve"
    case medium = "Equilibrado"
    case strong = "Forte"

    var id: String { rawValue }
}

enum DrinkWizardOccasion: String, CaseIterable, Identifiable, Codable {
    case casual = "Casual"
    case dinner = "Jantar"
    case party = "Festa"
    case date = "Encontro"
    case relax = "Relaxar"

    var id: String { rawValue }
}
