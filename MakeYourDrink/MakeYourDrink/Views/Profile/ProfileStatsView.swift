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

    private var mostPreparedDrinkName: String {
        guard !appState.drinkHistory.isEmpty else { return "-" }

        let grouped = Dictionary(grouping: appState.drinkHistory, by: { $0.drinkName })

        return grouped
            .max { $0.value.count < $1.value.count }?
            .key ?? "-"
    }

    private var bestRatedDrinkName: String {
        guard let bestRating = appState.drinkRatings.max(by: { $0.rating < $1.rating }) else {
            return "-"
        }

        return MockData.drinks.first {
            $0.id == bestRating.drinkID
        }?.name ?? "-"
    }

    private var favoriteBaseName: String {
        let bases = appState.userIngredients.filter {
            $0.category == .spirits
        }

        return bases.first?.name ?? "-"
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

            VStack(spacing: 10) {
                detailRow(
                    icon: "flame.fill",
                    title: "Mais preparado",
                    value: mostPreparedDrinkName
                )

                detailRow(
                    icon: "trophy.fill",
                    title: "Melhor avaliado",
                    value: bestRatedDrinkName
                )

                detailRow(
                    icon: "drop.fill",
                    title: "Base no seu bar",
                    value: favoriteBaseName
                )

                detailRow(
                    icon: "sparkles",
                    title: "Drinks IA salvos",
                    value: "\(appState.savedAISuggestions.count)"
                )

                detailRow(
                    icon: "checkmark.seal.fill",
                    title: "Avaliações feitas",
                    value: "\(appState.drinkRatings.count)"
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

    private func detailRow(
        icon: String,
        title: String,
        value: String
    ) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(DrinkColors.accent)
                .frame(width: 24)

            Text(title)
                .foregroundStyle(DrinkColors.textPrimary)

            Spacer()

            Text(value)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(DrinkColors.textSecondary)
                .lineLimit(1)
        }
        .padding(16)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}
