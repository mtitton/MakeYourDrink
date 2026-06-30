//
//  DrinkTag.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 29/06/26.
//

import Foundation

enum DrinkTag: String, CaseIterable, Identifiable, Codable {
    case iba = "IBA"
    case classic = "Clássico"
    case easy = "Fácil"
    case party = "Festa"
    case summer = "Verão"
    case winter = "Inverno"
    case happyHour = "Happy Hour"
    case brunch = "Brunch"
    case dinner = "Jantar"
    case noAlcohol = "Sem álcool"
    case floral = "Floral"
    case signature = "Assinado"
    case afterDinner = "Pós jantar"
    case modern = "Moderno"
    case tiki = "Tiki"
    case kids = "Para menores"
    case healthy = "Saudável"

    var id: String { rawValue }
}
