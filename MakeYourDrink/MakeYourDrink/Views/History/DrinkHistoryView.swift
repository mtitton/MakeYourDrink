//
//  DrinkHistoryView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct DrinkHistoryView: View {
    @EnvironmentObject private var appState: AppState

    @State private var searchText = ""

    private var filteredHistory: [DrinkHistoryItem] {
        if searchText.isEmpty {
            return appState.drinkHistory
        }

        return appState.drinkHistory.filter {
            $0.drinkName.localizedCaseInsensitiveContains(searchText)
        }
    }

    private var groupedHistory: [(title: String, items: [DrinkHistoryItem])] {
        let calendar = Calendar.current

        let grouped = Dictionary(grouping: filteredHistory) { item in
            calendar.startOfDay(for: item.preparedAt)
        }

        return grouped
            .sorted { $0.key > $1.key }
            .map { date, items in
                (
                    title: sectionTitle(for: date),
                    items: items.sorted { $0.preparedAt > $1.preparedAt }
                )
            }
    }

    private var uniquePreparedCount: Int {
        Set(appState.drinkHistory.map { $0.drinkID }).count
    }

    private var lastPreparedName: String {
        appState.drinkHistory.first?.drinkName ?? "-"
    }

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            if appState.drinkHistory.isEmpty {
                emptyState
            } else {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        header
                        summaryCard
                        searchField
                        historySections
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

            Text("Acompanhe sua jornada de bartender.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    private var summaryCard: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(appState.drinkHistory.count) preparo\(appState.drinkHistory.count == 1 ? "" : "s")")
                        .font(.title2.bold())
                        .foregroundStyle(DrinkColors.textPrimary)

                    Text("\(uniquePreparedCount) drink\(uniquePreparedCount == 1 ? "" : "s") diferente\(uniquePreparedCount == 1 ? "" : "s")")
                        .font(.subheadline)
                        .foregroundStyle(DrinkColors.textSecondary)
                }

                Spacer()

                Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: 34))
                    .foregroundStyle(DrinkColors.accent)
            }

            HStack(spacing: 12) {
                Image(systemName: "flame.fill")
                    .foregroundStyle(DrinkColors.accent)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Último drink")
                        .font(.caption)
                        .foregroundStyle(DrinkColors.textSecondary)

                    Text(lastPreparedName)
                        .font(.headline)
                        .foregroundStyle(DrinkColors.textPrimary)
                        .lineLimit(1)
                }

                Spacer()
            }
            .padding(14)
            .background(DrinkColors.card)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
        .padding(20)
        .background(
            LinearGradient(
                colors: [
                    DrinkColors.cardSecondary,
                    DrinkColors.card
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
    }

    private var searchField: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")

            TextField("Buscar no histórico", text: $searchText)
                .textInputAutocapitalization(.words)
                .autocorrectionDisabled()

            if !searchText.isEmpty {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                }
            }
        }
        .foregroundStyle(DrinkColors.textSecondary)
        .padding(16)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    @ViewBuilder
    private var historySections: some View {
        if filteredHistory.isEmpty {
            emptySearchState
        } else {
            VStack(alignment: .leading, spacing: 22) {
                ForEach(groupedHistory, id: \.title) { section in
                    VStack(alignment: .leading, spacing: 12) {
                        Text(section.title)
                            .font(.headline)
                            .foregroundStyle(DrinkColors.accent)

                        VStack(spacing: 12) {
                            ForEach(section.items) { item in
                                historyCard(item)
                            }
                        }
                    }
                }
            }
        }
    }

    private func historyCard(_ item: DrinkHistoryItem) -> some View {
        let match = matchForHistoryItem(item)

        return Group {
            if let match {
                NavigationLink {
                    DrinkDetailView(match: match)
                } label: {
                    historyCardContent(item)
                }
                .buttonStyle(.plain)
            } else {
                historyCardContent(item)
            }
        }
        .contextMenu {
            Button(role: .destructive) {
                appState.drinkHistory.removeAll { $0.id == item.id }
                HapticService.medium()
            } label: {
                Label("Remover do histórico", systemImage: "trash")
            }
        }
    }

    private func historyCardContent(_ item: DrinkHistoryItem) -> some View {
        HStack(spacing: 14) {
            DrinkImageView(
                imageName: item.imageName,
                drinkName: item.drinkName
            )
            .frame(width: 92, height: 68)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

            VStack(alignment: .leading, spacing: 5) {
                Text(item.drinkName)
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)

                Text(item.preparedAt.formatted(date: .omitted, time: .shortened))
                    .font(.caption)
                    .foregroundStyle(DrinkColors.textSecondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(DrinkColors.textSecondary)
        }
        .padding(14)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }

    private var emptySearchState: some View {
        VStack(spacing: 16) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 44))
                .foregroundStyle(DrinkColors.accent)

            Text("Nenhum resultado")
                .font(.title3.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Tente buscar por outro drink.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
        .padding(28)
        .frame(maxWidth: .infinity)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private var emptyState: some View {
        VStack(spacing: 18) {
            Image(systemName: "clock.arrow.circlepath")
                .font(.system(size: 52))
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

    private func matchForHistoryItem(_ item: DrinkHistoryItem) -> DrinkMatch? {
        appState.matches.first {
            $0.drink.id == item.drinkID
        }
    }

    private func sectionTitle(for date: Date) -> String {
        let calendar = Calendar.current

        if calendar.isDateInToday(date) {
            return "Hoje"
        }

        if calendar.isDateInYesterday(date) {
            return "Ontem"
        }

        return date.formatted(
            .dateTime
                .day()
                .month(.wide)
        )
    }
}
