//
//  PromptAnalyzer.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import Foundation

struct DrinkPromptAnalysis {
    let preferredBase: String?
    let flavor: PromptFlavor?
    let strength: PromptStrength?
}

enum PromptFlavor {
    case citrus
    case sweet
    case refreshing
    case fruity
    case bitter
}

enum PromptStrength {
    case light
    case medium
    case strong
}

enum PromptAnalyzer {
    static func analyze(_ prompt: String) -> DrinkPromptAnalysis {
        let text = prompt
            .lowercased()
            .folding(options: .diacriticInsensitive, locale: .current)

        return DrinkPromptAnalysis(
            preferredBase: detectBase(in: text),
            flavor: detectFlavor(in: text),
            strength: detectStrength(in: text)
        )
    }

    private static func detectBase(in text: String) -> String? {
        let bases = ["gin", "vodka", "rum", "cachaca", "whisky", "tequila"]

        return bases.first { text.contains($0) }.map {
            switch $0 {
            case "cachaca": return "Cachaça"
            default: return $0.capitalized
            }
        }
    }

    private static func detectFlavor(in text: String) -> PromptFlavor? {
        if text.contains("citrico") || text.contains("limao") {
            return .citrus
        }

        if text.contains("doce") || text.contains("adocicado") {
            return .sweet
        }

        if text.contains("refrescante") || text.contains("leve") {
            return .refreshing
        }

        if text.contains("frutado") || text.contains("fruta") {
            return .fruity
        }

        if text.contains("amargo") || text.contains("bitter") {
            return .bitter
        }

        return nil
    }

    private static func detectStrength(in text: String) -> PromptStrength? {
        if text.contains("leve") || text.contains("fraco") || text.contains("pouco alcool") {
            return .light
        }

        if text.contains("forte") || text.contains("alcoolico") {
            return .strong
        }

        return .medium
    }
}
