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

    var body: some View {
        NavigationStack {
            ZStack {
                DrinkColors.background
                    .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        header
                        searchField
                        selectedSection
                        allIngredientsSection
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
            Text("O que você tem em casa?")
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Selecione seus ingredientes para receber sugestões melhores.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    private var searchField: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(DrinkColors.textSecondary)

            TextField("Buscar ingrediente", text: $searchText)
                .foregroundStyle(DrinkColors.textPrimary)
                .textInputAutocapitalization(.words)
                .autocorrectionDisabled()
        }
        .padding(16)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var selectedSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Selecionados")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            if appState.userIngredients.isEmpty {
                Text("Nenhum ingrediente selecionado ainda.")
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
                    .padding(18)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(DrinkColors.card)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            } else {
                FlowLayout(spacing: 10) {
                    ForEach(appState.userIngredients, id: \.self) { ingredient in
                        IngredientPill(name: ingredient.name)
                            .onTapGesture {
                                appState.toggleIngredient(ingredient)
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
                    VStack(alignment: .leading, spacing: 10) {
                        Text(category.rawValue)
                            .font(.headline)
                            .foregroundStyle(DrinkColors.accent)

                        VStack(spacing: 10) {
                            ForEach(ingredients) { ingredient in
                                ingredientRow(ingredient)
                            }
                        }
                    }
                }
            }
        }
    }

    private func ingredientRow(_ ingredient: Ingredient) -> some View {
        let isSelected = appState.hasIngredient(ingredient)

        return Button {
            appState.toggleIngredient(ingredient)
        } label: {
            HStack {
                Text(ingredient.name)
                    .foregroundStyle(DrinkColors.textPrimary)

                Spacer()

                Image(systemName: isSelected ? "checkmark.circle.fill" : "plus.circle")
                    .foregroundStyle(isSelected ? DrinkColors.success : DrinkColors.accent)
            }
            .padding(16)
            .background(DrinkColors.card)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
        .buttonStyle(.plain)
    }
}
