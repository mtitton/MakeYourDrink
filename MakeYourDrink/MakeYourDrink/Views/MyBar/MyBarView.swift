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

    private var filteredIngredients: [Ingredient] {
        if searchText.isEmpty {
            return MockData.ingredients
        }

        return MockData.ingredients.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }

    private var groupedIngredients: [IngredientCategory: [Ingredient]] {
        Dictionary(grouping: filteredIngredients, by: { $0.category })
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

    private var mostUsefulIngredient: String {
        let suggestions = ShoppingListService.suggestions(matches: appState.matches)
        return suggestions.first?.ingredientName ?? "-"
    }

    var body: some View {
        NavigationStack {
            ZStack {
                DrinkColors.background
                    .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        FadeInView(delay: 0.00) {
                            header
                        }

                        FadeInView(delay: 0.05) {
                            summaryCard
                        }

                        FadeInView(delay: 0.10) {
                            searchField
                        }

                        FadeInView(delay: 0.15) {
                            if appState.userIngredients.isEmpty {
                                emptySelectedState
                            } else {
                                selectedSection
                            }
                        }

                        FadeInView(delay: 0.20) {
                            allIngredientsSection
                        }

                        FadeInView(delay: 0.25) {
                            insightSection
                        }
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

            Text("Gerencie seus ingredientes e descubra o que pode preparar.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    private var summaryCard: some View {
        PremiumCard {
            VStack(alignment: .leading, spacing: 18) {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("\(selectedCount) ingredientes")
                            .font(.title2.bold())
                            .foregroundStyle(DrinkColors.textPrimary)

                        Text("Você pode preparar \(availableDrinksCount) drink\(availableDrinksCount == 1 ? "" : "s") agora")
                            .font(.subheadline)
                            .foregroundStyle(DrinkColors.textSecondary)
                    }

                    Spacer()

                    Image(systemName: "shippingbox.fill")
                        .font(.system(size: 34))
                        .foregroundStyle(DrinkColors.accent)
                        .symbolEffect(.pulse, value: selectedCount)
                }

                VStack(alignment: .leading, spacing: 8) {
                    ProgressView(value: progress)
                        .tint(DrinkColors.accent)

                    Text("\(selectedCount) de \(totalCount) ingredientes cadastrados")
                        .font(.caption)
                        .foregroundStyle(DrinkColors.textSecondary)
                }
            }
        }
        .scaleOnAppear()
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
                    HapticService.light()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(DrinkColors.textSecondary)
                }
                .buttonStyle(PremiumButtonStyle())
            }
        }
        .padding(16)
        .background(DrinkColors.card)
        .overlay {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .strokeBorder(Color.white.opacity(0.05), lineWidth: 1)
        }
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var emptySelectedState: some View {
        PremiumCard {
            VStack(spacing: 16) {
                Image(systemName: "wineglass")
                    .font(.system(size: 44))
                    .foregroundStyle(DrinkColors.accent)

                Text("Seu bar está vazio")
                    .font(.title3.bold())
                    .foregroundStyle(DrinkColors.textPrimary)

                Text("Adicione ingredientes para desbloquear receitas e recomendações.")
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
        }
        .scaleOnAppear()
    }

    private var selectedSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Selecionados")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(DrinkColors.textPrimary)

                Spacer()

                Button {
                    appState.userIngredients.removeAll()
                    HapticService.medium()
                } label: {
                    Text("Limpar")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(DrinkColors.accent)
                }
                .buttonStyle(PremiumButtonStyle())
            }

            FlowLayout(spacing: 10) {
                ForEach(Array(appState.userIngredients.enumerated()), id: \.element.id) { index, ingredient in
                    FadeInView(delay: Double(index) * 0.03) {
                        IngredientPill(name: ingredient.name)
                            .scaleOnAppear()
                            .onTapGesture {
                                appState.toggleIngredient(ingredient)
                                HapticService.light()
                            }
                            .contextMenu {
                                Button(role: .destructive) {
                                    appState.toggleIngredient(ingredient)
                                    HapticService.medium()
                                } label: {
                                    Label("Remover", systemImage: "trash")
                                }
                            }
                    }
                }
            }
        }
    }

    private var allIngredientsSection: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Todos os ingredientes")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            ForEach(IngredientCategory.allCases) { category in
                if let ingredients = groupedIngredients[category], !ingredients.isEmpty {
                    ingredientCategorySection(
                        category: category,
                        ingredients: ingredients
                    )
                }
            }
        }
    }

    private func ingredientCategorySection(
        category: IngredientCategory,
        ingredients: [Ingredient]
    ) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(category.rawValue)
                    .font(.headline)
                    .foregroundStyle(DrinkColors.accent)

                Spacer()

                Text("\(ingredients.filter { appState.hasIngredient($0) }.count)/\(ingredients.count)")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(DrinkColors.textSecondary)
            }

            VStack(spacing: 10) {
                ForEach(Array(ingredients.enumerated()), id: \.element.id) { index, ingredient in
                    FadeInView(delay: Double(index) * 0.02) {
                        ingredientRow(ingredient)
                    }
                }
            }
        }
    }

    private func ingredientRow(_ ingredient: Ingredient) -> some View {
        let isSelected = appState.hasIngredient(ingredient)

        return Button {
            withAnimation(.spring(response: 0.28, dampingFraction: 0.82)) {
                appState.toggleIngredient(ingredient)
            }
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
                            .symbolEffect(.bounce, value: isSelected)
                    }

                VStack(alignment: .leading, spacing: 4) {
                    Text(ingredient.name)
                        .font(.headline)
                        .foregroundStyle(DrinkColors.textPrimary)

                    Text(ingredient.category.rawValue)
                        .font(.caption)
                        .foregroundStyle(DrinkColors.textSecondary)
                }

                Spacer()

                Image(systemName: isSelected ? "checkmark.circle.fill" : "plus.circle")
                    .foregroundStyle(isSelected ? DrinkColors.success : DrinkColors.accent)
            }
            .padding(16)
            .background(DrinkColors.card)
            .overlay {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .strokeBorder(
                        isSelected ? DrinkColors.accent.opacity(0.35) : Color.white.opacity(0.05),
                        lineWidth: 1
                    )
            }
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
        .buttonStyle(PremiumButtonStyle())
        .contextMenu {
            Button {
                appState.toggleIngredient(ingredient)
                HapticService.light()
            } label: {
                Label(
                    isSelected ? "Remover do Meu Bar" : "Adicionar ao Meu Bar",
                    systemImage: isSelected ? "minus.circle" : "plus.circle"
                )
            }
        }
    }

    private var insightSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Insight do Bar")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            PremiumCard {
                HStack(spacing: 14) {
                    Image(systemName: "sparkles")
                        .foregroundStyle(DrinkColors.accent)
                        .symbolEffect(.pulse)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Ingrediente mais útil")
                            .font(.headline)
                            .foregroundStyle(DrinkColors.textPrimary)

                        Text(mostUsefulIngredient == "-" ? "Adicione mais ingredientes para gerar insights." : mostUsefulIngredient)
                            .font(.subheadline)
                            .foregroundStyle(DrinkColors.textSecondary)
                    }

                    Spacer()
                }
            }
        }
    }
}
