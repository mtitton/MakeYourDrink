//
//  MyBarView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct MyBarView: View {
    @EnvironmentObject private var appState: AppState

    @State private var searchText = ""
    @State private var expandedCategories: Set<IngredientCategory> = Set(IngredientCategory.allCases)

    private var filteredIngredients: [Ingredient] {
        guard !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return MockData.ingredients
        }

        let query = searchText.lowercased()

        return MockData.ingredients.filter {
            $0.name.lowercased().contains(query) ||
            $0.searchAliases.contains { $0.lowercased().contains(query) } ||
            $0.category.rawValue.lowercased().contains(query)
        }
    }

    private var groupedIngredients: [(category: IngredientCategory, ingredients: [Ingredient])] {
        Dictionary(grouping: filteredIngredients, by: { $0.category })
            .map { category, ingredients in
                (
                    category: category,
                    ingredients: ingredients.sorted { $0.name < $1.name }
                )
            }
            .sorted { $0.category.rawValue < $1.category.rawValue }
    }

    private var selectedCount: Int {
        appState.userIngredients.count
    }

    private var totalCount: Int {
        MockData.ingredients.count
    }

    private var progress: Double {
        guard totalCount > 0 else { return 0 }
        return min(Double(selectedCount) / Double(totalCount), 1)
    }

    private var availableDrinksCount: Int {
        appState.matches.filter { $0.matchPercentage == 100 }.count
    }

    private var almostDrinksCount: Int {
        appState.matches.filter { $0.matchPercentage >= 70 && $0.matchPercentage < 100 }.count
    }

    private var bodyTitle: String {
        if selectedCount == 0 {
            return "Seu bar está vazio"
        }

        if availableDrinksCount > 0 {
            return "Seu bar já prepara \(availableDrinksCount) drink\(availableDrinksCount == 1 ? "" : "s")"
        }

        return "Você está começando seu bar"
    }

    var body: some View {
        NavigationStack {
            ZStack {
                DrinkColors.background
                    .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        header
                        summaryCard
                        quickStats
                        searchField
                        selectedSection
                        ingredientsSection
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 32)
                }
            }
            .navigationTitle("Meu Bar")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Meu Bar")
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Gerencie seus ingredientes e descubra o que já consegue preparar.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    private var summaryCard: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(bodyTitle)
                        .font(.title2.bold())
                        .foregroundStyle(DrinkColors.textPrimary)

                    Text("\(selectedCount) de \(totalCount) ingredientes cadastrados")
                        .font(.subheadline)
                        .foregroundStyle(DrinkColors.textSecondary)
                }

                Spacer()

                Image(systemName: "shippingbox.fill")
                    .font(.system(size: 34))
                    .foregroundStyle(DrinkColors.accent)
            }

            VStack(alignment: .leading, spacing: 8) {
                ProgressView(value: progress)
                    .tint(DrinkColors.accent)

                Text("\(Int(progress * 100))% do catálogo no seu bar")
                    .font(.caption)
                    .foregroundStyle(DrinkColors.textSecondary)
            }
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

    private var quickStats: some View {
        HStack(spacing: 12) {
            statCard(
                title: "Prontos",
                value: "\(availableDrinksCount)",
                icon: "checkmark.circle.fill"
            )

            statCard(
                title: "Quase lá",
                value: "\(almostDrinksCount)",
                icon: "sparkles"
            )

            statCard(
                title: "Ingredientes",
                value: "\(selectedCount)",
                icon: "wineglass"
            )
        }
    }

    private func statCard(
        title: String,
        value: String,
        icon: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(DrinkColors.accent)

            Text(value)
                .font(.title2.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text(title)
                .font(.caption)
                .foregroundStyle(DrinkColors.textSecondary)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var searchField: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(DrinkColors.textSecondary)

            TextField("Buscar ingrediente", text: $searchText)
                .foregroundStyle(DrinkColors.textPrimary)
                .textInputAutocapitalization(.words)
                .autocorrectionDisabled()

            if !searchText.isEmpty {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(DrinkColors.textSecondary)
                }
            }
        }
        .padding(16)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var selectedSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Selecionados")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(DrinkColors.textPrimary)

                Spacer()

                if !appState.userIngredients.isEmpty {
                    Button {
                        appState.userIngredients.removeAll()
                        HapticService.medium()
                    } label: {
                        Text("Limpar")
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(DrinkColors.accent)
                    }
                }
            }

            if appState.userIngredients.isEmpty {
                emptySelectedState
            } else {
                FlowLayout(spacing: 10) {
                    ForEach(appState.userIngredients.sorted { $0.name < $1.name }) { ingredient in
                        IngredientPill(name: ingredient.name)
                            .onTapGesture {
                                appState.toggleIngredient(ingredient)
                                HapticService.light()
                            }
                    }
                }
            }
        }
    }

    private var emptySelectedState: some View {
        VStack(spacing: 14) {
            Image(systemName: "wineglass")
                .font(.system(size: 34))
                .foregroundStyle(DrinkColors.accent)

            Text("Adicione ingredientes para desbloquear receitas.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
                .multilineTextAlignment(.center)
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }

    private var ingredientsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Todos os ingredientes")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            VStack(spacing: 12) {
                ForEach(groupedIngredients, id: \.category.id) { group in
                    categorySection(
                        category: group.category,
                        ingredients: group.ingredients
                    )
                }
            }
        }
    }

    private func categorySection(
        category: IngredientCategory,
        ingredients: [Ingredient]
    ) -> some View {
        let selectedInCategory = ingredients.filter {
            appState.hasIngredient($0)
        }.count

        let isExpanded = expandedCategories.contains(category)

        return VStack(spacing: 0) {
            Button {
                toggleCategory(category)
            } label: {
                HStack(spacing: 12) {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(category.rawValue)
                                .font(.headline)
                                .foregroundStyle(DrinkColors.textPrimary)

                            Spacer()

                            Text("\(selectedInCategory)/\(ingredients.count)")
                                .font(.caption.weight(.bold))
                                .foregroundStyle(DrinkColors.accent)

                            Image(systemName: "chevron.down")
                                .font(.caption.weight(.bold))
                                .foregroundStyle(DrinkColors.textSecondary)
                                .rotationEffect(.degrees(isExpanded ? 0 : -90))
                        }

                        ProgressView(value: categoryProgress(selected: selectedInCategory, total: ingredients.count))
                            .tint(DrinkColors.accent)
                    }
                }
                .padding(16)
                .background(DrinkColors.card)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: isExpanded ? 20 : 18,
                        style: .continuous
                    )
                )
            }
            .buttonStyle(.plain)

            if isExpanded {
                VStack(spacing: 10) {
                    ForEach(ingredients) { ingredient in
                        ingredientRow(ingredient)
                    }
                }
                .padding(.top, 10)
            }
        }
    }

    private func ingredientRow(_ ingredient: Ingredient) -> some View {
        let isSelected = appState.hasIngredient(ingredient)

        return Button {
            appState.toggleIngredient(ingredient)
            HapticService.light()
        } label: {
            HStack(spacing: 14) {
                Circle()
                    .fill(isSelected ? DrinkColors.accent : DrinkColors.cardSecondary)
                    .frame(width: 38, height: 38)
                    .overlay {
                        Image(systemName: isSelected ? "checkmark" : "plus")
                            .font(.caption.bold())
                            .foregroundStyle(isSelected ? .black : DrinkColors.accent)
                    }

                VStack(alignment: .leading, spacing: 4) {
                    Text(ingredient.name)
                        .font(.headline)
                        .foregroundStyle(DrinkColors.textPrimary)

                    if !ingredient.searchAliases.isEmpty {
                        Text(ingredient.searchAliases.joined(separator: ", "))
                            .font(.caption)
                            .foregroundStyle(DrinkColors.textSecondary)
                            .lineLimit(1)
                    } else {
                        Text(ingredient.category.rawValue)
                            .font(.caption)
                            .foregroundStyle(DrinkColors.textSecondary)
                    }
                }

                Spacer()

                if ingredient.isAlcoholic {
                    Image(systemName: "drop.fill")
                        .font(.caption)
                        .foregroundStyle(DrinkColors.textSecondary)
                }
            }
            .padding(16)
            .background(DrinkColors.card)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
        .buttonStyle(.plain)
    }

    private func toggleCategory(_ category: IngredientCategory) {
        if expandedCategories.contains(category) {
            expandedCategories.remove(category)
        } else {
            expandedCategories.insert(category)
        }

        HapticService.light()
    }

    private func categoryProgress(
        selected: Int,
        total: Int
    ) -> Double {
        guard total > 0 else { return 0 }
        return Double(selected) / Double(total)
    }
}
