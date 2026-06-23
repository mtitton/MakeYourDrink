//
//  FavoritesView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject private var appState: AppState

    private var favoriteMatches: [DrinkMatch] {
        appState.matches.filter {
            appState.favoriteDrinkIDs.contains($0.drink.id)
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                DrinkColors.background
                    .ignoresSafeArea()

                if favoriteMatches.isEmpty {
                    emptyState
                } else {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 16) {
                            header

                            ForEach(favoriteMatches) { match in
                                DrinkCard(match: match)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .padding(.bottom, 32)
                    }
                }
            }
            .navigationTitle("Favoritos")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Seus drinks salvos")
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Receitas que você quer preparar de novo.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart")
                .font(.system(size: 48))
                .foregroundStyle(DrinkColors.accent)

            Text("Nenhum favorito ainda")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Abra uma receita e toque no coração para salvar.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
                .multilineTextAlignment(.center)
        }
        .padding(32)
    }
}
