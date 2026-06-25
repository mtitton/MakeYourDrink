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
        if shouldReplace(aiName) {
            return generatedName(from: ingredients)
        }

        return aiName
    }

    private static func shouldReplace(_ name: String) -> Bool {
        let value = normalize(name)

        let forbiddenWords = [
            "drink",
            "cocktail",
            "mix",
            "ai",
            "recipe",
            "special",
            "bebida",
            "receita"
        ]

        if forbiddenWords.contains(where: { value.contains($0) }) {
            return true
        }

        if value.count < 4 {
            return true
        }

        return false
    }

    private static func generatedName(
        from ingredients: [DrinkIngredient]
    ) -> String {
        let names = ingredients.map { normalize($0.name) }

        let base = detectedBase(from: names)
        let flavor = detectedFlavor(from: names)
        let style = detectedStyle(from: names)

        let options = namesFor(
            base: base,
            flavor: flavor,
            style: style
        )

        return options.randomElement() ?? "Golden Hour"
    }

    private static func detectedBase(from names: [String]) -> String? {
        if names.contains("gin") { return "gin" }
        if names.contains("vodka") { return "vodka" }
        if names.contains("rum") { return "rum" }
        if names.contains("whisky") { return "whisky" }
        if names.contains("tequila") { return "tequila" }
        if names.contains("cachaca") { return "cachaca" }
        return nil
    }

    private static func detectedFlavor(from names: [String]) -> String? {
        if names.contains(where: { $0.contains("limao") }) { return "citrus" }
        if names.contains(where: { $0.contains("laranja") }) { return "orange" }
        if names.contains(where: { $0.contains("morango") }) { return "berry" }
        if names.contains(where: { $0.contains("maracuja") }) { return "passion" }
        if names.contains(where: { $0.contains("abacaxi") }) { return "pineapple" }
        if names.contains(where: { $0.contains("hortela") }) { return "mint" }
        return nil
    }

    private static func detectedStyle(from names: [String]) -> String {
        if names.contains(where: { $0.contains("agua tonica") }) { return "tonic" }
        if names.contains(where: { $0.contains("agua com gas") }) { return "sparkling" }
        if names.contains(where: { $0.contains("grenadine") }) { return "sweet" }
        return "signature"
    }

    private static func namesFor(
        base: String?,
        flavor: String?,
        style: String
    ) -> [String] {
        switch (base, flavor, style) {

        case ("gin", "citrus", _):
            return [
                "Botanical Citrus",
                "Garden Lime",
                "Citrus Garden",
                "Emerald Lime",
                "Golden Botanist"
            ]

        case ("gin", "mint", _):
            return [
                "Emerald Garden",
                "Mint Botanist",
                "Green Whisper",
                "Botanical Breeze",
                "Garden Mist"
            ]

        case ("vodka", "citrus", _):
            return [
                "Crystal Lime",
                "Nordic Citrus",
                "Citrus Frost",
                "Golden Frost",
                "Lime Crystal"
            ]

        case ("vodka", "passion", _):
            return [
                "Passion Frost",
                "Golden Passion",
                "Tropical Frost",
                "Sunset Vodka",
                "Passion Glow"
            ]

        case ("rum", "pineapple", _):
            return [
                "Island Escape",
                "Caribbean Sunset",
                "Golden Island",
                "Paradise Wave",
                "Tropical Tide"
            ]

        case ("rum", "citrus", _):
            return [
                "Caribbean Lime",
                "Golden Rum Breeze",
                "Island Citrus",
                "Lime Harbor",
                "Sunset Rum"
            ]

        case ("tequila", "citrus", _):
            return [
                "Agave Lime",
                "Desert Citrus",
                "Sol Dorado",
                "Golden Agave",
                "Baja Breeze"
            ]

        case ("whisky", "orange", _):
            return [
                "Amber Orange",
                "Golden Barrel",
                "Citrus Reserve",
                "Velvet Barrel",
                "Orange Oak"
            ]

        case (_, "berry", _):
            return [
                "Ruby Sunset",
                "Crimson Kiss",
                "Berry Velvet",
                "Red Horizon",
                "Velvet Berry"
            ]

        case (_, "orange", _):
            return [
                "Orange Horizon",
                "Golden Sunset",
                "Citrus Glow",
                "Amber Sunrise",
                "Solar Orange"
            ]

        case (_, "mint", _):
            return [
                "Mint Garden",
                "Green Whisper",
                "Emerald Breeze",
                "Fresh Garden",
                "Garden Spark"
            ]

        default:
            return [
                "Golden Hour",
                "Midnight Gold",
                "Velvet Night",
                "Crystal Breeze",
                "Amber Glow",
                "Twilight Elixir",
                "Signature Reserve"
            ]
        }
    }

    private static func normalize(_ value: String) -> String {
        value
            .lowercased()
            .folding(options: .diacriticInsensitive, locale: .current)
    }
}
