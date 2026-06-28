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

    private var checkedItemsCount: Int {
        appState.shoppingListItems.filter { $0.isChecked }.count
    }

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    FadeInView(delay: 0.00) {
                        header
                    }

                    if hasContent {
                        if !appState.shoppingListItems.isEmpty {
                            FadeInView(delay: 0.05) {
                                summaryCard
                            }

                            FadeInView(delay: 0.10) {
                                manualListSection
                            }
                        }

                        if !suggestions.isEmpty {
                            FadeInView(delay: 0.15) {
                                suggestionsSection
                            }
                        }
                    } else {
                        FadeInView(delay: 0.05) {
                            emptyState
                        }
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

    private var summaryCard: some View {
        PremiumCard {
            HStack(spacing: 14) {
                Image(systemName: "cart.fill")
                    .font(.title2)
                    .foregroundStyle(DrinkColors.accent)

                VStack(alignment: .leading, spacing: 4) {
                    Text("\(appState.shoppingListItems.count) item\(appState.shoppingListItems.count == 1 ? "" : "s") na lista")
                        .font(.headline)
                        .foregroundStyle(DrinkColors.textPrimary)

                    Text("\(checkedItemsCount) comprado\(checkedItemsCount == 1 ? "" : "s")")
                        .font(.subheadline)
                        .foregroundStyle(DrinkColors.textSecondary)
                }

                Spacer()
            }
        }
        .scaleOnAppear()
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
                ForEach(Array(appState.shoppingListItems.enumerated()), id: \.element.id) { index, item in
                    FadeInView(delay: Double(index) * 0.03) {
                        manualItemRow(item)
                    }
                }
            }
        }
    }

    private func manualItemRow(_ item: ShoppingListItem) -> some View {
        Button {
            withAnimation(.spring(response: 0.25, dampingFraction: 0.82)) {
                appState.toggleShoppingListItem(item)
            }
            HapticService.light()
        } label: {
            HStack(spacing: 14) {
                Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                    .font(.title3)
                    .foregroundStyle(item.isChecked ? DrinkColors.success : DrinkColors.accent)
                    .symbolEffect(.bounce, value: item.isChecked)

                Text(item.name)
                    .font(.headline)
                    .foregroundStyle(item.isChecked ? DrinkColors.textSecondary : DrinkColors.textPrimary)
                    .strikethrough(item.isChecked)

                Spacer()

                Button {
                    withAnimation(.spring(response: 0.25, dampingFraction: 0.82)) {
                        appState.removeShoppingListItem(item)
                    }
                    HapticService.medium()
                } label: {
                    Image(systemName: "trash")
                        .font(.caption)
                        .foregroundStyle(DrinkColors.textSecondary)
                        .padding(8)
                }
                .buttonStyle(PremiumButtonStyle())
            }
            .padding(16)
            .background(DrinkColors.card)
            .overlay {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .strokeBorder(
                        item.isChecked ? DrinkColors.success.opacity(0.20) : Color.white.opacity(0.05),
                        lineWidth: 1
                    )
            }
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
        .buttonStyle(PremiumButtonStyle())
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
                ForEach(Array(suggestions.enumerated()), id: \.element.id) { index, suggestion in
                    FadeInView(delay: Double(index) * 0.03) {
                        suggestionRow(suggestion)
                    }
                }
            }
        }
    }

    private func suggestionRow(_ suggestion: ShoppingSuggestion) -> some View {
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
                .buttonStyle(PremiumButtonStyle())

                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(DrinkColors.textSecondary)
            }
            .padding(16)
            .background(DrinkColors.card)
            .overlay {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .strokeBorder(Color.white.opacity(0.05), lineWidth: 1)
            }
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
        .buttonStyle(PremiumButtonStyle())
    }

    private var emptyState: some View {
        PremiumCard {
            VStack(spacing: 16) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 48))
                    .foregroundStyle(DrinkColors.success)
                    .symbolEffect(.pulse)

                Text("Você já tem tudo")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(DrinkColors.textPrimary)

                Text("Nenhum ingrediente faltando para os drinks disponíveis.")
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
        }
        .scaleOnAppear()
    }
}
