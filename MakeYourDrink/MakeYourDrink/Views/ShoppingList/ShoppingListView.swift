//
//  ShoppingListView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct ShoppingListView: View {
    @EnvironmentObject private var appState: AppState

    private var suggestions: [ShoppingSuggestion] {
        ShoppingListService.suggestions(matches: appState.matches)
    }

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    header

                    if suggestions.isEmpty {
                        emptyState
                    } else {
                        suggestionsSection
                    }
                }
                .padding(20)
            }
        }
        .navigationTitle("Lista de Compras")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Compre menos. Faça mais drinks.")
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Veja quais ingredientes desbloqueiam mais receitas.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    private var suggestionsSection: some View {
        VStack(spacing: 12) {
            ForEach(suggestions) { suggestion in
                NavigationLink {
                    ShoppingIngredientDetailView(suggestion: suggestion)
                } label: {
                    HStack(spacing: 14) {
                        Image(systemName: "cart.fill")
                            .foregroundStyle(DrinkColors.accent)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(suggestion.ingredientName)
                                .font(.headline)
                                .foregroundStyle(DrinkColors.textPrimary)

                            Text("Desbloqueia \(suggestion.unlockCount) drink\(suggestion.unlockCount == 1 ? "" : "s")")
                                .font(.subheadline)
                                .foregroundStyle(DrinkColors.textSecondary)
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundStyle(DrinkColors.textSecondary)
                    }
                    .padding(16)
                    .background(DrinkColors.card)
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                }
                .buttonStyle(.plain)
            }
        }
    }

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 48))
                .foregroundStyle(DrinkColors.success)

            Text("Você já tem tudo")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Nenhum ingrediente faltando para os drinks disponíveis.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
                .multilineTextAlignment(.center)
        }
        .padding(32)
        .frame(maxWidth: .infinity)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}
