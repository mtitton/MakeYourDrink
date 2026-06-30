//
//  DrinkCategory.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum DrinkCategory: String, CaseIterable, Identifiable, Codable {
    case classic = "Clássico"
    case sour = "Sour"
    case tiki = "Tiki"
    case highball = "Highball"
    case martini = "Martini"
    case spritz = "Spritz"
    case frozen = "Frozen"
    case dessert = "Sobremesa"
    case mocktail = "Sem álcool"
    case signature = "Autoral"
    case modern = "Moderno"
    case tropical = "Tropical"
    case sparkling = "Espumante"
    case wine = "Vinho"
    case beer = "Cerveja"
    case afterDinner = "Pós jantar"

    var id: String { rawValue }
}
