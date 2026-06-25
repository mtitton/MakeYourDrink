//
//  FavoriteSummaryCard.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import SwiftUI

struct FavoriteSummaryCard: View {
    let totalFavorites: Int
    let readyCount: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {

            HStack {
                VStack(alignment: .leading, spacing: 6) {

                    Text("\(totalFavorites) favoritos")
                        .font(.title2.bold())

                    Text(
                        "\(readyCount) disponíveis agora"
                    )
                    .font(.subheadline)
                    .foregroundStyle(
                        DrinkColors.textSecondary
                    )
                }

                Spacer()

                Image(systemName: "heart.fill")
                    .font(.system(size: 34))
                    .foregroundStyle(
                        DrinkColors.accent
                    )
            }
        }
        .padding(20)
        .background(
            LinearGradient(
                colors: [
                    DrinkColors.cardSecondary,
                    DrinkColors.card
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 28,
                style: .continuous
            )
        )
    }
}
