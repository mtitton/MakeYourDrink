//
//  RecipeMetadataBuilder.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 27/06/26.
//

import Foundation

enum RecipeMetadataBuilder {
    static func build(for suggestion: AIBartenderSuggestion) -> DrinkRecipeMetadata {
        let ingredientNames = suggestion.ingredients.map {
            $0.name.lowercased()
        }

        let hasSpirit = ingredientNames.contains {
            $0.contains("gin") ||
            $0.contains("vodka") ||
            $0.contains("rum") ||
            $0.contains("whisky") ||
            $0.contains("tequila") ||
            $0.contains("cachaça")
        }

        let hasFruit = ingredientNames.contains {
            $0.contains("limão") ||
            $0.contains("laranja") ||
            $0.contains("morango") ||
            $0.contains("maracujá") ||
            $0.contains("abacaxi")
        }

        return DrinkRecipeMetadata(
            preparationTime: suggestion.ingredients.count > 5 ? "4 min" : "2 min",
            servings: "1 drink",
            alcoholLevel: hasSpirit ? "Médio" : "Sem álcool",
            glass: "Highball",
            method: "Build",
            difficulty: suggestion.ingredients.count > 6 ? "Médio" : "Fácil",
            pairing: hasFruit ? ["Petiscos", "Frutos do mar"] : ["Queijos", "Aperitivos"]
        )
    }

    static func build(for drink: Drink) -> DrinkRecipeMetadata {
        DrinkRecipeMetadata(
            preparationTime: drink.ingredients.count > 5 ? "4 min" : "2 min",
            servings: "\(drink.servings) drink\(drink.servings == 1 ? "" : "s")",
            alcoholLevel: drink.alcoholicLevel.rawValue,
            glass: drink.metadata.glass.rawValue,
            method: drink.metadata.category.rawValue,
            difficulty: drink.difficulty.rawValue,
            pairing: drink.metadata.tags.map { $0.rawValue }
        )
    }
}
