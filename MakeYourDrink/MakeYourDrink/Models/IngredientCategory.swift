//
//  IngredientCategory.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

enum IngredientCategory: String, CaseIterable, Identifiable, Codable, Hashable {
    case spirits = "Destilados"
    case liqueurs = "Licores"
    case wines = "Vinhos"
    case beers = "Cervejas"
    case mixers = "Mixers"
    case juices = "Sucos"
    case syrups = "Xaropes"
    case fruits = "Frutas"
    case herbs = "Ervas"
    case garnishes = "Guarnições"
    case dairy = "Cremes e Leites"
    case eggs = "Ovos"
    case spices = "Especiarias"
    case bitters = "Bitters e Molhos"
    case others = "Outros"

    var id: String { rawValue }
}
