//
//  DrinkImagePlaceholderView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct DrinkImagePlaceholderView: View {
    let drinkName: String

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    DrinkColors.cardSecondary,
                    DrinkColors.card,
                    DrinkColors.background
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            Circle()
                .fill(DrinkColors.accent.opacity(0.18))
                .frame(width: 120, height: 120)
                .blur(radius: 18)
                .offset(x: 50, y: -40)

            VStack(spacing: 12) {
                Image(systemName: iconName)
                    .font(.system(size: 44, weight: .semibold))
                    .foregroundStyle(DrinkColors.accent)

                Text(drinkName)
                    .font(.headline.weight(.semibold))
                    .foregroundStyle(DrinkColors.textPrimary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
            .padding()
        }
    }

    private var iconName: String {
        let lowercasedName = drinkName.lowercased()

        if lowercasedName.contains("gin") {
            return "wineglass"
        }

        if lowercasedName.contains("whisky") {
            return "circle.grid.2x2.fill"
        }

        if lowercasedName.contains("mule") {
            return "mug.fill"
        }

        if lowercasedName.contains("caipirinha") || lowercasedName.contains("mojito") {
            return "leaf.fill"
        }

        return "wineglass.fill"
    }
}
