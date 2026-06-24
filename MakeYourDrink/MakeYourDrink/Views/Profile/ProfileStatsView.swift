//
//  ProfileStatsView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct ProfileStatsView: View {
    @EnvironmentObject private var appState: AppState

    private var averageRating: Double {
        guard !appState.drinkRatings.isEmpty else { return 0 }

        let total = appState.drinkRatings.reduce(0) {
            $0 + $1.rating
        }

        return Double(total) / Double(appState.drinkRatings.count)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Estatísticas")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            LazyVGrid(
                columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ],
                spacing: 12
            ) {
                statCard(
                    icon: "wineglass.fill",
                    value: "\(appState.drinkHistory.count)",
                    title: "Preparados"
                )

                statCard(
                    icon: "heart.fill",
                    value: "\(appState.favoriteDrinkIDs.count)",
                    title: "Favoritos"
                )

                statCard(
                    icon: "shippingbox.fill",
                    value: "\(appState.userIngredients.count)",
                    title: "Ingredientes"
                )

                statCard(
                    icon: "star.fill",
                    value: averageRating == 0 ? "-" : String(format: "%.1f", averageRating),
                    title: "Nota média"
                )
            }
        }
    }

    private func statCard(
        icon: String,
        value: String,
        title: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(DrinkColors.accent)

            Text(value)
                .font(.title.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text(title)
                .font(.caption)
                .foregroundStyle(DrinkColors.textSecondary)
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }
}
