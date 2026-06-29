//
//  GlassType.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum GlassType: String, CaseIterable, Identifiable, Codable {
    case rocks = "Rocks"
    case coupe = "Coupe"
    case martini = "Martini"
    case highball = "Highball"
    case collins = "Collins"
    case mug = "Caneca"
    case flute = "Flute"
    case wine = "Taça"
    case shot = "Shot"

    var id: String { rawValue }
}
