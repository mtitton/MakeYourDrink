//
//  RecipeMetadataCard.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 27/06/26.
//

import SwiftUI

struct RecipeMetadataCard: View {
    let metadata: DrinkRecipeMetadata

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Ficha da receita")
                .font(.headline)
                .foregroundStyle(DrinkColors.textPrimary)

            LazyVGrid(
                columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ],
                spacing: 12
            ) {
                item(icon: "clock.fill", title: "Tempo", value: metadata.preparationTime)
                item(icon: "person.fill", title: "Rendimento", value: metadata.servings)
                item(icon: "drop.fill", title: "Teor", value: metadata.alcoholLevel)
                item(icon: "wineglass.fill", title: "Copo", value: metadata.glass)
                item(icon: "snowflake", title: "Método", value: metadata.method)
                item(icon: "chart.bar.fill", title: "Dificuldade", value: metadata.difficulty)
            }

            VStack(alignment: .leading, spacing: 8) {
                Label("Harmoniza com", systemImage: "fork.knife")
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)

                Text(metadata.pairing.joined(separator: ", "))
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
            }
        }
        .padding(18)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private func item(
        icon: String,
        title: String,
        value: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: icon)
                .foregroundStyle(DrinkColors.accent)

            Text(title)
                .font(.caption)
                .foregroundStyle(DrinkColors.textSecondary)

            Text(value)
                .font(.headline)
                .foregroundStyle(DrinkColors.textPrimary)
                .lineLimit(1)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(DrinkColors.cardSecondary)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}
