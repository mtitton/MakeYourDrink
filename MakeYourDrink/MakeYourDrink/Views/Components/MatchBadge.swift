//
//  MatchBadge.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct MatchBadge: View {
    let percentage: Int

    var body: some View {
        Text("\(percentage)% match")
            .font(.caption.weight(.semibold))
            .foregroundStyle(.black)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(DrinkColors.accent)
            .clipShape(Capsule())
    }
}
