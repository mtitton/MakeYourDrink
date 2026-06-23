//
//  DrinkDetailView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct DrinkDetailView: View {
    @EnvironmentObject private var appState: AppState
    
    let match: DrinkMatch

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    header

                    matchSection

                    ingredientsSection

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
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            DrinkColors.cardSecondary,
                            DrinkColors.card
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 220)
                .overlay {
                    Image(systemName: "wineglass.fill")
                        .font(.system(size: 72))
                        .foregroundStyle(DrinkColors.accent)
                }

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

    private var ingredientsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Ingredientes")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            VStack(spacing: 10) {
                ForEach(match.drink.ingredients, id: \.self) { ingredient in
                    let isAvailable = match.availableIngredients.contains(ingredient)

                    HStack {
                        Image(systemName: isAvailable ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundStyle(isAvailable ? DrinkColors.success : DrinkColors.danger)

                        Text(ingredient)
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
