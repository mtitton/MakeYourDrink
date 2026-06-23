//
//  DiscoverView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct DiscoverView: View {
    @EnvironmentObject private var appState: AppState

    @State private var searchText = ""
    @State private var selectedFilter: DiscoverFilter = .all

    private var filteredMatches: [DrinkMatch] {
        appState.matches.filter { match in
            let matchesSearch = searchText.isEmpty ||
            match.drink.name.localizedCaseInsensitiveContains(searchText)

            let matchesFilter: Bool

            switch selectedFilter {
            case .all:
                matchesFilter = true
            case .readyNow:
                matchesFilter = match.matchPercentage == 100
            case .almostThere:
                matchesFilter = match.matchPercentage >= 60 && match.matchPercentage < 100
            case .easy:
                matchesFilter = match.drink.difficulty == .easy
            }

            return matchesSearch && matchesFilter
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                DrinkColors.background
                    .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        header
                        searchField
                        filters
                        results
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 32)
                }
            }
            .navigationTitle("Descobrir")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Descubra novos drinks")
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Explore receitas com base no que você tem.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    private var searchField: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(DrinkColors.textSecondary)

            TextField("Buscar drink", text: $searchText)
                .foregroundStyle(DrinkColors.textPrimary)
                .textInputAutocapitalization(.words)
                .autocorrectionDisabled()
        }
        .padding(16)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var filters: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(DiscoverFilter.allCases) { filter in
                    Button {
                        selectedFilter = filter
                    } label: {
                        Text(filter.title)
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(selectedFilter == filter ? .black : DrinkColors.textPrimary)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 9)
                            .background(selectedFilter == filter ? DrinkColors.accent : DrinkColors.card)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var results: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("\(filteredMatches.count) resultado\(filteredMatches.count == 1 ? "" : "s")")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            if filteredMatches.isEmpty {
                Text("Nenhum drink encontrado com esses filtros.")
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
                    .padding(18)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(DrinkColors.card)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            } else {
                VStack(spacing: 14) {
                    ForEach(filteredMatches) { match in
                        DrinkCard(match: match)
                    }
                }
            }
        }
    }
}

enum DiscoverFilter: String, CaseIterable, Identifiable {
    case all
    case readyNow
    case almostThere
    case easy

    var id: String { rawValue }

    var title: String {
        switch self {
        case .all:
            "Todos"
        case .readyNow:
            "Dá para fazer"
        case .almostThere:
            "Quase lá"
        case .easy:
            "Fáceis"
        }
    }
}
