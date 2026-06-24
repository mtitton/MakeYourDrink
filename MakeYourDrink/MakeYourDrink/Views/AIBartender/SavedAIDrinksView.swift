//
//  SavedAIDrinksView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct SavedAIDrinksView: View {

    @EnvironmentObject private var appState: AppState

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            if appState.savedAISuggestions.isEmpty {
                emptyState
            } else {
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 16) {

                        ForEach(appState.savedAISuggestions) { drink in

                            NavigationLink {
                                SavedAIDrinkDetailView(
                                    suggestion: drink
                                )
                            } label: {
                                drinkCard(drink)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(20)
                }
            }
        }
        .navigationTitle("Meus Drinks AI")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func drinkCard(
        _ drink: AIBartenderSuggestion
    ) -> some View {

        VStack(alignment: .leading, spacing: 10) {

            HStack {
                Image(systemName: "sparkles")
                    .foregroundStyle(DrinkColors.accent)

                Text(drink.name)
                    .font(.headline)
                    .foregroundStyle(
                        DrinkColors.textPrimary
                    )

                Spacer()
            }

            Text(drink.description)
                .font(.subheadline)
                .foregroundStyle(
                    DrinkColors.textSecondary
                )
        }
        .padding(18)
        .background(
            DrinkColors.card
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 22,
                style: .continuous
            )
        )
    }

    private var emptyState: some View {

        VStack(spacing: 18) {

            Image(systemName: "sparkles")
                .font(.system(size: 52))
                .foregroundStyle(
                    DrinkColors.accent
                )

            Text("Nenhum drink criado ainda")
                .font(.title3.bold())
                .foregroundStyle(
                    DrinkColors.textPrimary
                )

            Text(
                "Use o AI Bartender para criar receitas personalizadas."
            )
            .multilineTextAlignment(.center)
            .foregroundStyle(
                DrinkColors.textSecondary
            )
        }
        .padding(32)
    }
}
