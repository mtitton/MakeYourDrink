//
//  DrinkDetailView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct DrinkDetailView: View {
    @EnvironmentObject private var appState: AppState
    @State private var servings = 1

    let match: DrinkMatch
    var namespace: Namespace.ID? = nil

    private let partyOptions = [1, 2, 4, 6, 8]

    private var multiplier: Double {
        Double(servings)
    }

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    header
                    matchSection
                    chatButton
                    availabilitySection
                    partyModeSection
                    ingredientsSection
                    prepareButton
                    instructionsSection
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 32)
            }
        }
        .navigationTitle(match.drink.name)
        .navigationBarTitleDisplayMode(.inline)
        .applyNavigationTransition(
            id: match.drink.id,
            namespace: namespace
        )
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                ShareLink(item: shareText) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundStyle(DrinkColors.accent)
                }

                Button {
                    appState.toggleFavorite(match.drink)
                    HapticService.success()
                } label: {
                    Image(systemName: appState.isFavorite(match.drink) ? "heart.fill" : "heart")
                        .foregroundStyle(DrinkColors.accent)
                        .symbolEffect(.bounce, value: appState.isFavorite(match.drink))
                }
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 12) {
            DrinkImageView(
                imageName: match.drink.imageName,
                drinkName: match.drink.name
            )
            .frame(height: 240)
            .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))

            Text(match.drink.description)
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)

            HStack(spacing: 10) {
                Label(match.drink.difficulty.rawValue, systemImage: "star.fill")
                Label(match.drink.alcoholicLevel.rawValue, systemImage: "drop.fill")
            }
            .font(.caption.weight(.medium))
            .foregroundStyle(DrinkColors.textSecondary)

            if let rating = appState.rating(for: match.drink) {
                HStack(spacing: 4) {
                    ForEach(1...5, id: \.self) { value in
                        Image(systemName: value <= rating ? "star.fill" : "star")
                            .foregroundStyle(DrinkColors.accent)
                    }
                }
                .font(.caption)
            }
        }
    }

    private var matchSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Match")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            HStack {
                Text("\(match.matchPercentage)%")
                    .font(.largeTitle.bold())
                    .foregroundStyle(DrinkColors.accent)

                VStack(alignment: .leading, spacing: 4) {
                    Text(match.matchPercentage == 100 ? "Você tem tudo" : "Quase lá")
                        .font(.headline)
                        .foregroundStyle(DrinkColors.textPrimary)

                    Text(match.matchPercentage == 100 ? "Dá para preparar agora." : "Faltam poucos ingredientes.")
                        .font(.subheadline)
                        .foregroundStyle(DrinkColors.textSecondary)
                }

                Spacer()
            }
            .padding(18)
            .background(DrinkColors.card)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        }
    }

    private var availabilitySection: some View {
        HStack(spacing: 12) {
            availabilityCard(
                title: "Você tem",
                value: "\(match.availableIngredients.count)",
                icon: "checkmark.circle.fill",
                color: DrinkColors.success
            )

            availabilityCard(
                title: "Falta",
                value: "\(match.missingIngredients.count)",
                icon: "xmark.circle.fill",
                color: DrinkColors.danger
            )
        }
    }

    private func availabilityCard(
        title: String,
        value: String,
        icon: String,
        color: Color
    ) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(color)

            Text(value)
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text(title)
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }

    private var partyModeSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Party Mode")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Ajuste a quantidade de pessoas e veja os ingredientes recalculados.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(partyOptions, id: \.self) { option in
                        Button {
                            servings = option
                            HapticService.light()
                        } label: {
                            Text(option == 1 ? "1 pessoa" : "\(option) pessoas")
                                .font(.subheadline.weight(.semibold))
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .background(servings == option ? DrinkColors.accent : DrinkColors.card)
                                .foregroundStyle(servings == option ? .black : DrinkColors.textPrimary)
                                .clipShape(Capsule())
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }

    private var ingredientsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Ingredientes para \(servings) pessoa\(servings == 1 ? "" : "s")")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            VStack(spacing: 10) {
                ForEach(match.drink.ingredients, id: \.self) { ingredient in
                    let isAvailable = match.availableIngredients.contains(ingredient.name)
                    let totalAmount = scaledAmount(ingredient.amount)

                    HStack {
                        Image(systemName: isAvailable ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundStyle(isAvailable ? DrinkColors.success : DrinkColors.danger)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(ingredient.name)
                                .foregroundStyle(DrinkColors.textPrimary)

                            Text("\(formattedAmount(totalAmount)) \(ingredient.unit.rawValue)")
                                .font(.caption)
                                .foregroundStyle(DrinkColors.textSecondary)
                        }

                        Spacer()
                    }
                    .padding(14)
                    .background(DrinkColors.card)
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                }
            }
        }
    }

    private var prepareButton: some View {
        NavigationLink {
            PreparationView(drink: match.drink)
        } label: {
            Text(match.matchPercentage == 100 ? "Preparar agora" : "Ver o preparo")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(DrinkColors.accent)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
    }

    private var instructionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Modo de preparo")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            VStack(spacing: 12) {
                ForEach(Array(match.drink.instructions.enumerated()), id: \.offset) { index, instruction in
                    HStack(alignment: .top, spacing: 12) {
                        Text("\(index + 1)")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .frame(width: 32, height: 32)
                            .background(DrinkColors.accent)
                            .clipShape(Circle())

                        Text(instruction)
                            .font(.body)
                            .foregroundStyle(DrinkColors.textPrimary)

                        Spacer()
                    }
                    .padding(14)
                    .background(DrinkColors.card)
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                }
            }
        }
    }

    private var shareText: String {
        let ingredients = match.drink.ingredients
            .map {
                "- \(formattedAmount(scaledAmount($0.amount))) \($0.unit.rawValue) \($0.name)"
            }
            .joined(separator: "\n")

        let instructions = match.drink.instructions
            .enumerated()
            .map {
                "\($0.offset + 1). \($0.element)"
            }
            .joined(separator: "\n")

        return """
        🍸 \(match.drink.name)

        \(match.drink.description)

        Ingredientes para \(servings) pessoa\(servings == 1 ? "" : "s"):
        \(ingredients)

        Modo de preparo:
        \(instructions)

        Criado no Make Your Drink.
        """
    }

    private func scaledAmount(_ amount: Double) -> Double {
        amount * multiplier
    }

    private func formattedAmount(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(value))
        }

        return String(format: "%.1f", value)
    }
    
    private var chatButton: some View {
        NavigationLink {
            DrinkChatView(suggestion: match.drink.aiSuggestion)
        } label: {
            HStack(spacing: 14) {
                Image(systemName: "bubble.left.and.bubble.right.fill")
                    .font(.title3)
                    .foregroundStyle(DrinkColors.accent)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Perguntar ao Bartender")
                        .font(.headline)
                        .foregroundStyle(DrinkColors.textPrimary)

                    Text("Tire dúvidas sobre substituições, preparo e variações.")
                        .font(.caption)
                        .foregroundStyle(DrinkColors.textSecondary)
                }

                Spacer()

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
