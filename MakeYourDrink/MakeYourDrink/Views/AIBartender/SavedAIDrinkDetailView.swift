//
//  SavedAIDrinkDetailView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct SavedAIDrinkDetailView: View {

    let suggestion: AIBartenderSuggestion

    var body: some View {

        ZStack {

            DrinkColors.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(alignment: .leading, spacing: 24) {

                    FadeInView(delay: 0.00) {
                        header
                    }

                    FadeInView(delay: 0.05) {
                        metadataSection
                    }

                    FadeInView(delay: 0.10) {
                        ingredientsSection
                    }

                    FadeInView(delay: 0.15) {
                        instructionsSection
                    }
                }
                .padding(20)
            }
        }
        .navigationTitle(suggestion.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {

        PremiumCard {

            VStack(alignment: .leading, spacing: 14) {

                HStack {

                    Image(systemName: "sparkles")
                        .font(.title2)
                        .foregroundStyle(DrinkColors.accent)
                        .symbolEffect(.pulse)

                    Text(suggestion.name)
                        .font(.largeTitle.bold())
                        .foregroundStyle(DrinkColors.textPrimary)

                    Spacer()
                }

                Text(suggestion.description)
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
            }
        }
        .scaleOnAppear()
    }

    private var metadataSection: some View {

        RecipeMetadataCard(
            metadata: RecipeMetadataBuilder.build(for: suggestion)
        )
    }

    private var ingredientsSection: some View {

        PremiumCard {

            VStack(alignment: .leading, spacing: 16) {

                Label("Ingredientes", systemImage: "shippingbox.fill")
                    .font(.title3.bold())
                    .foregroundStyle(DrinkColors.textPrimary)

                VStack(spacing: 12) {

                    ForEach(suggestion.ingredients) { ingredient in

                        HStack(spacing: 14) {

                            Circle()
                                .fill(DrinkColors.success)
                                .frame(width: 10, height: 10)

                            VStack(alignment: .leading, spacing: 2) {

                                Text(ingredient.name)
                                    .font(.headline)
                                    .foregroundStyle(DrinkColors.textPrimary)

                                Text(
                                    "\(formattedAmount(ingredient.amount)) \(ingredient.unit.rawValue)"
                                )
                                .font(.caption)
                                .foregroundStyle(DrinkColors.textSecondary)
                            }

                            Spacer()
                        }
                    }
                }
            }
        }
    }

    private var instructionsSection: some View {

        PremiumCard {

            VStack(alignment: .leading, spacing: 16) {

                Label("Modo de preparo", systemImage: "list.number")
                    .font(.title3.bold())
                    .foregroundStyle(DrinkColors.textPrimary)

                VStack(spacing: 14) {

                    ForEach(
                        Array(suggestion.instructions.enumerated()),
                        id: \.offset
                    ) { index, step in

                        HStack(alignment: .top, spacing: 14) {

                            Text("\(index + 1)")
                                .font(.headline.bold())
                                .foregroundStyle(.black)
                                .frame(width: 34, height: 34)
                                .background(DrinkColors.accent)
                                .clipShape(Circle())

                            Text(step)
                                .foregroundStyle(DrinkColors.textPrimary)

                            Spacer()
                        }
                    }
                }
            }
        }
    }

    private func formattedAmount(
        _ value: Double
    ) -> String {

        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(value))
        }

        return String(format: "%.1f", value)
    }
}
