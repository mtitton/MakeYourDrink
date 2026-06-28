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
                FadeInView(delay: 0.00) {
                    emptyState
                }
                .padding(20)
            } else {
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 16) {
                        ForEach(Array(appState.savedAISuggestions.enumerated()), id: \.element.id) { index, drink in
                            FadeInView(delay: Double(index) * 0.04) {
                                NavigationLink {
                                    SavedAIDrinkDetailView(
                                        suggestion: drink
                                    )
                                } label: {
                                    drinkCard(drink)
                                }
                                .buttonStyle(PremiumButtonStyle())
                            }
                        }
                    }
                    .padding(20)
                }
            }
        }
        .navigationTitle("Meus Drinks IA")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func drinkCard(
        _ drink: AIBartenderSuggestion
    ) -> some View {
        PremiumCard {
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 12) {
                    Image(systemName: "sparkles")
                        .foregroundStyle(DrinkColors.accent)
                        .symbolEffect(.pulse)

                    Text(drink.name)
                        .font(.headline)
                        .foregroundStyle(DrinkColors.textPrimary)

                    Spacer()

                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundStyle(DrinkColors.textSecondary)
                }

                Text(drink.description)
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
                    .lineLimit(3)

                Text("\(drink.ingredients.count) ingrediente\(drink.ingredients.count == 1 ? "" : "s")")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(DrinkColors.accent)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(DrinkColors.cardSecondary)
                    .clipShape(Capsule())
            }
        }
        .scaleOnAppear()
    }

    private var emptyState: some View {
        PremiumCard {
            VStack(spacing: 18) {
                Image(systemName: "sparkles")
                    .font(.system(size: 52))
                    .foregroundStyle(DrinkColors.accent)
                    .symbolEffect(.pulse)

                Text("Nenhum drink criado ainda")
                    .font(.title3.bold())
                    .foregroundStyle(DrinkColors.textPrimary)

                Text("Use a IA Bartender para criar receitas personalizadas.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(DrinkColors.textSecondary)
            }
            .frame(maxWidth: .infinity)
        }
        .scaleOnAppear()
    }
}
