//
//  SearchView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct SearchView: View {

    @EnvironmentObject private var appState: AppState

    @State private var searchText = ""

    private var filteredMatches: [DrinkMatch] {

        if searchText.isEmpty {
            return appState.matches
        }

        let query = searchText.lowercased()

        return appState.matches.filter { match in

            if match.drink.name
                .lowercased()
                .contains(query) {
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

                emptyState

            } else {

                ScrollView(showsIndicators: false) {

                    VStack(spacing: 14) {

                        ForEach(filteredMatches) { match in
                            DrinkCard(match: match)
                        }
                    }
                    .padding(.horizontal, 20)
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

    private var emptyState: some View {

        VStack(spacing: 16) {

            Image(systemName: "magnifyingglass")
                .font(.system(size: 48))
                .foregroundStyle(
                    DrinkColors.accent
                )

            Text("Nenhum drink encontrado")
                .font(.title3.bold())

            Text(
                "Tente pesquisar por nome ou ingrediente."
            )
            .foregroundStyle(
                DrinkColors.textSecondary
            )
        }
    }
}
