//
//  CocktailNamingService.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import Foundation

enum CocktailNamingService {

    static func bestName(
        aiName: String,
        ingredients: [DrinkIngredient]
    ) -> String {
        generatedName(from: ingredients)
    }

    private static func generatedName(
        from ingredients: [DrinkIngredient]
    ) -> String {
        let names = ingredients.map { normalize($0.name) }

        let base = detectedBase(from: names)
        let fruit = detectedFruit(from: names)
        let herb = detectedHerb(from: names)
        let mixer = detectedMixer(from: names)

        if let base, let fruit {
            return "\(fruit.displayName) \(base.displayName)"
        }

        if let base, let herb {
            return "\(herb.displayName) \(base.displayName)"
        }

        if let base, let mixer {
            return "\(base.displayName) \(mixer.displayName)"
        }

        if let base {
            return "\(base.displayName) Signature"
        }

        return "Golden Signature"
    }

    private static func detectedBase(from names: [String]) -> CocktailBase? {
        if names.contains("vodka") { return .vodka }
        if names.contains("gin") { return .gin }
        if names.contains("rum") { return .rum }
        if names.contains("whisky") { return .whisky }
        if names.contains("tequila") { return .tequila }
        if names.contains("cachaca") { return .cachaca }
        return nil
    }

    private static func detectedFruit(from names: [String]) -> CocktailFlavor? {
        if names.contains(where: { $0.contains("morango") }) { return .strawberry }
        if names.contains(where: { $0.contains("maracuja") }) { return .passionFruit }
        if names.contains(where: { $0.contains("abacaxi") }) { return .pineapple }
        if names.contains(where: { $0.contains("laranja") }) { return .orange }
        if names.contains(where: { $0.contains("limao") }) { return .lime }
        return nil
    }

    private static func detectedHerb(from names: [String]) -> CocktailFlavor? {
        if names.contains(where: { $0.contains("hortela") }) { return .mint }
        if names.contains(where: { $0.contains("alecrim") }) { return .rosemary }
        if names.contains(where: { $0.contains("manjericao") }) { return .basil }
        return nil
    }

    private static func detectedMixer(from names: [String]) -> CocktailFlavor? {
        if names.contains(where: { $0.contains("agua tonica") }) { return .tonic }
        if names.contains(where: { $0.contains("agua com gas") }) { return .sparkling }
        if names.contains(where: { $0.contains("grenadine") }) { return .sunset }
        return nil
    }

    private static func normalize(_ value: String) -> String {
        value
            .lowercased()
            .folding(options: .diacriticInsensitive, locale: .current)
    }
}

private enum CocktailBase {
    case vodka
    case gin
    case rum
    case whisky
    case tequila
    case cachaca

    var displayName: String {
        switch self {
        case .vodka: return "Vodka"
        case .gin: return "Gin"
        case .rum: return "Rum"
        case .whisky: return "Whisky"
        case .tequila: return "Agave"
        case .cachaca: return "Caipira"
        }
    }
}

private enum CocktailFlavor {
    case strawberry
    case passionFruit
    case pineapple
    case orange
    case lime
    case mint
    case rosemary
    case basil
    case tonic
    case sparkling
    case sunset

    var displayName: String {
        switch self {
        case .strawberry: return "Strawberry"
        case .passionFruit: return "Passion"
        case .pineapple: return "Pineapple"
        case .orange: return "Orange"
        case .lime: return "Citrus"
        case .mint: return "Mint"
        case .rosemary: return "Rosemary"
        case .basil: return "Basil"
        case .tonic: return "Tonic"
        case .sparkling: return "Sparkling"
        case .sunset: return "Sunset"
        }
    }
}
