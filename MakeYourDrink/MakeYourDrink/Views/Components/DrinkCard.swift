//
//  DrinkCard.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct DrinkCard: View {
    let match: DrinkMatch

    var body: some View {
        NavigationLink {
            DrinkDetailView(match: match)
        } label: {
            VStack(alignment: .leading, spacing: 14) {
                DrinkImagePlaceholderView(drinkName: match.drink.name)
                    .frame(height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(match.drink.name)
                            .font(.headline.weight(.semibold))
                            .foregroundStyle(DrinkColors.textPrimary)

                        Text(match.drink.description)
                            .font(.subheadline)
                            .foregroundStyle(DrinkColors.textSecondary)
                            .lineLimit(2)
                    }

                    Spacer()

                    MatchBadge(percentage: match.matchPercentage)
                }

                HStack(spacing: 8) {
                    Label(match.drink.difficulty.rawValue, systemImage: "star.fill")
                    Label(match.drink.alcoholicLevel.rawValue, systemImage: "drop.fill")
                }
                .font(.caption)
                .foregroundStyle(DrinkColors.textSecondary)

                if !match.missingIngredients.isEmpty {
                    Text("Falta: \(match.missingIngredients.joined(separator: ", "))")
                        .font(.caption)
                        .foregroundStyle(DrinkColors.textSecondary)
                } else {
                    Text("Você tem tudo para preparar agora")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(DrinkColors.success)
                }
            }
            .padding(18)
            .background(DrinkColors.card)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        }
        .buttonStyle(.plain)
    }
}
