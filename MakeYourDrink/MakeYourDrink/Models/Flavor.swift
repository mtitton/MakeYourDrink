//
//  Flavor.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum Flavor: String, CaseIterable, Identifiable, Codable {
    case sweet = "Doce"
    case sour = "Cítrico"
    case bitter = "Amargo"
    case fruity = "Frutado"
    case herbal = "Herbal"
    case spicy = "Picante"
    case refreshing = "Refrescante"
    case creamy = "Cremoso"
    case strong = "Intenso"
    case dry = "Seco"
    case floral = "Floral"
    case nutty = "Amendoado"
    case tropical = "Tropical"
    case savory = "Salinos"
    case coffee = "Café"
    case smoky = "Defumado"

    var id: String { rawValue }
}
