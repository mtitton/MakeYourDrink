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

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    header
                    matchSection
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
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    appState.toggleFavorite(match.drink)
                } label: {
                    Image(systemName: appState.isFavorite(match.drink) ? "heart.fill" : "heart")
                        .foregroundStyle(DrinkColors.accent)
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

            HStack {
                Button {
                    if servings > 1 {
                        servings -= 1
                    }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(DrinkColors.accent)
                }

                Spacer()

                Text("\(servings) pessoa\(servings == 1 ? "" : "s")")
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)

                Spacer()

                Button {
                    servings += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(DrinkColors.accent)
                }
            }
            .padding(18)
            .background(DrinkColors.card)
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        }
    }

    private var ingredientsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Ingredientes")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            VStack(spacing: 10) {
                ForEach(match.drink.ingredients, id: \.self) { ingredient in
                    let isAvailable = match.availableIngredients.contains(ingredient.name)
                    let totalAmount = ingredient.amount * Double(servings)

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
    
    private func formattedAmount(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(value))
        }

        return String(format: "%.1f", value)
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
}
