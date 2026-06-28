//
//  SearchView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var appState: AppState
    @Namespace private var drinkNamespace

    @State private var searchText = ""

    private var filteredMatches: [DrinkMatch] {
        let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        if trimmed.isEmpty {
            return appState.matches
        }

        let query = trimmed.lowercased()

        return appState.matches.filter { match in
            if match.drink.name.lowercased().contains(query) {
                return true
            }

            if match.drink.ingredients.contains(where: {
                $0.name.lowercased().contains(query)
            }) {
                return true
            }

            return false
        }
    }

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            if filteredMatches.isEmpty {
                FadeInView(delay: 0.00) {
                    emptyState
                }
                .padding(20)
            } else {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 18) {
                        FadeInView(delay: 0.00) {
                            resultsHeader
                        }

                        LazyVStack(spacing: 14) {
                            ForEach(Array(filteredMatches.enumerated()), id: \.element.id) { index, match in
                                FadeInView(delay: Double(index) * 0.035) {
                                    DrinkCard(
                                        match: match,
                                        namespace: drinkNamespace
                                    )
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                    .padding(.bottom, 32)
                }
            }
        }
        .navigationTitle("Pesquisar")
        .navigationBarTitleDisplayMode(.large)
        .searchable(
            text: $searchText,
            prompt: "Nome ou ingrediente"
        )
    }

    private var resultsHeader: some View {
        PremiumCard {
            HStack(spacing: 14) {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundStyle(DrinkColors.accent)

                VStack(alignment: .leading, spacing: 4) {
                    Text(searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? "Todos os drinks" : "Resultados")
                        .font(.headline)
                        .foregroundStyle(DrinkColors.textPrimary)

                    Text("\(filteredMatches.count) drink\(filteredMatches.count == 1 ? "" : "s") encontrado\(filteredMatches.count == 1 ? "" : "s")")
                        .font(.subheadline)
                        .foregroundStyle(DrinkColors.textSecondary)
                }

                Spacer()
            }
        }
        .scaleOnAppear()
    }

    private var emptyState: some View {
        PremiumCard {
            VStack(spacing: 16) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 48))
                    .foregroundStyle(DrinkColors.accent)

                Text("Nenhum drink encontrado")
                    .font(.title3.bold())
                    .foregroundStyle(DrinkColors.textPrimary)

                Text("Tente pesquisar por nome, categoria ou ingrediente.")
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
        }
        .scaleOnAppear()
    }
}
