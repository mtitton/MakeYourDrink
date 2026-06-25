//
//  FavoritesView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject private var appState: AppState

    @Namespace private var drinkNamespace

    @State private var searchText = ""
    @State private var selectedFilter: FavoriteFilter = .all

    private var favoriteMatches: [DrinkMatch] {
        appState.matches.filter {
            appState.favoriteDrinkIDs.contains(
                $0.drink.id
            )
        }
    }

    private var filteredMatches: [DrinkMatch] {

        favoriteMatches.filter { match in

            let matchesSearch =
            searchText.isEmpty ||
            match.drink.name.localizedCaseInsensitiveContains(
                searchText
            )

            let matchesFilter: Bool

            switch selectedFilter {

            case .all:
                matchesFilter = true

            case .ready:
                matchesFilter =
                match.matchPercentage == 100

            case .almostReady:
                matchesFilter =
                match.matchPercentage < 100
            }

            return matchesSearch &&
            matchesFilter
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

                    ScrollView(
                        showsIndicators: false
                    ) {

                        VStack(
                            alignment: .leading,
                            spacing: 20
                        ) {

                            header

                            FavoriteSummaryCard(
                                totalFavorites: favoriteMatches.count,
                                readyCount: favoriteMatches.filter {
                                    $0.matchPercentage == 100
                                }.count
                            )

                            searchField

                            filters

                            LazyVStack(
                                spacing: 16
                            ) {

                                ForEach(
                                    filteredMatches
                                ) { match in

                                    DrinkCard(
                                        match: match,
                                        namespace: drinkNamespace
                                    )
                                }
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

        VStack(
            alignment: .leading,
            spacing: 8
        ) {

            Text("Favoritos")
                .font(.largeTitle.bold())
                .foregroundStyle(
                    DrinkColors.textPrimary
                )

            Text(
                "Seus drinks preferidos."
            )
            .font(.subheadline)
            .foregroundStyle(
                DrinkColors.textSecondary
            )
        }
    }

    private var searchField: some View {

        HStack(spacing: 10) {

            Image(
                systemName: "magnifyingglass"
            )

            TextField(
                "Buscar drink",
                text: $searchText
            )

            if !searchText.isEmpty {

                Button {

                    searchText = ""

                } label: {

                    Image(
                        systemName: "xmark.circle.fill"
                    )
                }
            }
        }
        .foregroundStyle(
            DrinkColors.textSecondary
        )
        .padding(16)
        .background(
            DrinkColors.card
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 18,
                style: .continuous
            )
        )
    }

    private var filters: some View {

        ScrollView(
            .horizontal,
            showsIndicators: false
        ) {

            HStack(spacing: 10) {

                ForEach(
                    FavoriteFilter.allCases
                ) { filter in

                    Button {

                        selectedFilter = filter
                        HapticService.light()

                    } label: {

                        Text(filter.rawValue)
                            .font(
                                .subheadline.weight(
                                    .semibold
                                )
                            )
                            .padding(
                                .horizontal,
                                16
                            )
                            .padding(
                                .vertical,
                                10
                            )
                            .background(
                                selectedFilter == filter
                                ? DrinkColors.accent
                                : DrinkColors.card
                            )
                            .foregroundStyle(
                                selectedFilter == filter
                                ? .black
                                : DrinkColors.textPrimary
                            )
                            .clipShape(
                                Capsule()
                            )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var emptyState: some View {

        VStack(spacing: 18) {

            Image(
                systemName: "heart.fill"
            )
            .font(.system(size: 54))
            .foregroundStyle(
                DrinkColors.accent
            )

            Text(
                "Nenhum favorito ainda"
            )
            .font(.title3.bold())

            Text(
                "Favorite receitas para encontrá-las rapidamente."
            )
            .font(.subheadline)
            .foregroundStyle(
                DrinkColors.textSecondary
            )
            .multilineTextAlignment(
                .center
            )
        }
        .padding(32)
    }
}
