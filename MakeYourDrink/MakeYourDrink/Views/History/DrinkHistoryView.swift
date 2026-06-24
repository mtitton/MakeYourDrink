//
//  DrinkHistoryView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct DrinkHistoryView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            if appState.drinkHistory.isEmpty {
                emptyState
            } else {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        header

                        ForEach(appState.drinkHistory) { item in
                            historyCard(item)
                        }
                    }
                    .padding(20)
                }
            }
        }
        .navigationTitle("Histórico")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Últimos preparados")
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Veja os drinks que você preparou recentemente.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    private func historyCard(_ item: DrinkHistoryItem) -> some View {
        HStack(spacing: 14) {
            DrinkImageView(
                imageName: item.imageName,
                drinkName: item.drinkName
            )
            .frame(width: 86, height: 64)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

            VStack(alignment: .leading, spacing: 4) {
                Text(item.drinkName)
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)

                Text(item.preparedAt.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption)
                    .foregroundStyle(DrinkColors.textSecondary)
            }

            Spacer()
        }
        .padding(14)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "clock.arrow.circlepath")
                .font(.system(size: 48))
                .foregroundStyle(DrinkColors.accent)

            Text("Nada preparado ainda")
                .font(.title3.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Quando você concluir uma receita, ela aparecerá aqui.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
                .multilineTextAlignment(.center)
        }
        .padding(32)
    }
}
