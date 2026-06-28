//
//  PremiumCard.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 27/06/26.
//

import SwiftUI

struct PremiumCard<Content: View>: View {

    @ViewBuilder
    let content: Content

    var body: some View {

        content
            .padding(20)
            .background(DrinkColors.card)
            .overlay {

                RoundedRectangle(
                    cornerRadius: 26
                )
                .strokeBorder(
                    Color.white.opacity(0.05),
                    lineWidth: 1
                )
            }
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 26,
                    style: .continuous
                )
            )
            .shadow(
                color: .black.opacity(0.12),
                radius: 18,
                y: 8
            )
    }
}
