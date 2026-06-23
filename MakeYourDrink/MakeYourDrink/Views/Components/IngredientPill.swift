//
//  IngredientPill.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct IngredientPill: View {
    let name: String

    var body: some View {
        Text(name)
            .font(.caption.weight(.medium))
            .foregroundStyle(DrinkColors.textPrimary)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(DrinkColors.cardSecondary)
            .clipShape(Capsule())
    }
}
