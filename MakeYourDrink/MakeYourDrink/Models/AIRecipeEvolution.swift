//
//  AIRecipeEvolution.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import Foundation

enum AIRecipeEvolution: String, CaseIterable, Identifiable {
    case citrus
    case sweet
    case stronger
    case tropical
    case frozen
    case nonAlcoholic
    case party
    case surprise

    var id: String { rawValue }

    var title: String {
        switch self {
        case .citrus: "Mais cítrico"
        case .sweet: "Mais doce"
        case .stronger: "Mais forte"
        case .tropical: "Tropical"
        case .frozen: "Frozen"
        case .nonAlcoholic: "Sem álcool"
        case .party: "Para festa"
        case .surprise: "Surpreenda-me"
        }
    }

    var emoji: String {
        switch self {
        case .citrus: "🍋"
        case .sweet: "🍓"
        case .stronger: "💪"
        case .tropical: "🌴"
        case .frozen: "❄️"
        case .nonAlcoholic: "🍹"
        case .party: "🎉"
        case .surprise: "❤️"
        }
    }

    var instruction: String {
        switch self {
        case .citrus:
            "Crie uma versão mais cítrica da receita."
        case .sweet:
            "Crie uma versão mais doce e agradável."
        case .stronger:
            "Crie uma versão mais intensa, respeitando limites seguros."
        case .tropical:
            "Crie uma versão tropical usando ingredientes permitidos."
        case .frozen:
            "Crie uma versão frozen ou mais gelada."
        case .nonAlcoholic:
            "Crie uma versão sem álcool."
        case .party:
            "Crie uma versão ideal para servir em festa."
        case .surprise:
            "Crie uma versão criativa e surpreendente."
        }
    }
}
