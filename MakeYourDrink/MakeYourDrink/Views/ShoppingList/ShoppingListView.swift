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

    private var hasContent: Bool {
        !appState.shoppingListItems.isEmpty || !suggestions.isEmpty
    }

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    header

                    if hasContent {
                        if !appState.shoppingListItems.isEmpty {
                            manualListSection
                        }

                        if !suggestions.isEmpty {
                            suggestionsSection
                        }
                    } else {
                        emptyState
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

            Text("Organize ingredientes faltantes e veja o que desbloqueia mais receitas.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    private var manualListSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Minha lista")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(DrinkColors.textPrimary)

                Spacer()

                Text("\(appState.shoppingListItems.count)")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(DrinkColors.textSecondary)
            }

            VStack(spacing: 10) {
                ForEach(appState.shoppingListItems) { item in
                    manualItemRow(item)
                }
            }
        }
    }

    private func manualItemRow(_ item: ShoppingListItem) -> some View {
        Button {
            appState.toggleShoppingListItem(item)
            HapticService.light()
        } label: {
            HStack(spacing: 14) {
                Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                    .font(.title3)
                    .foregroundStyle(item.isChecked ? DrinkColors.success : DrinkColors.accent)

                Text(item.name)
                    .font(.headline)
                    .foregroundStyle(item.isChecked ? DrinkColors.textSecondary : DrinkColors.textPrimary)
                    .strikethrough(item.isChecked)

                Spacer()

                Image(systemName: "trash")
                    .font(.caption)
                    .foregroundStyle(DrinkColors.textSecondary)
                    .onTapGesture {
                        appState.removeShoppingListItem(item)
                        HapticService.medium()
                    }
            }
            .padding(16)
            .background(DrinkColors.card)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
        .buttonStyle(.plain)
        .contextMenu {
            Button {
                appState.toggleShoppingListItem(item)
                HapticService.light()
            } label: {
                Label(
                    item.isChecked ? "Marcar como pendente" : "Marcar como comprado",
                    systemImage: item.isChecked ? "circle" : "checkmark.circle"
                )
            }

            Button(role: .destructive) {
                appState.removeShoppingListItem(item)
                HapticService.medium()
            } label: {
                Label("Remover", systemImage: "trash")
            }
        }
    }

    private var suggestionsSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Sugestões inteligentes")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

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

                            Button {
                                appState.addToShoppingList(suggestion.ingredientName)
                                HapticService.success()
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title3)
                                    .foregroundStyle(DrinkColors.accent)
                            }
                            .buttonStyle(.plain)

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
