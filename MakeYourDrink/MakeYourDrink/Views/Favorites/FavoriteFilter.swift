//
//  FavoriteFilter.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import Foundation

enum FavoriteFilter: String, CaseIterable, Identifiable {
    case all = "Todos"
    case ready = "100%"
    case almostReady = "Quase"

    var id: String {
        rawValue
    }
}
