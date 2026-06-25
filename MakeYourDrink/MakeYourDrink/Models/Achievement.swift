//
//  Achievement.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import Foundation

struct Achievement: Identifiable, Hashable {
    let id = UUID()

    let title: String
    let description: String
    let icon: String

    let current: Int
    let target: Int

    var unlocked: Bool {
        current >= target
    }

    var progress: Double {
        min(Double(current) / Double(target), 1)
    }
}
