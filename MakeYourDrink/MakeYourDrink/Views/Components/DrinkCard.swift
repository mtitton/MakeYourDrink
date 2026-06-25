//
//  DrinkCard.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct DrinkCard: View {
    @EnvironmentObject private var appState: AppState

    let match: DrinkMatch
    var namespace: Namespace.ID? = nil

    var body: some View {
        NavigationLink {
            DrinkDetailView(match: match, namespace: namespace)
        } label: {
            cardContent
        }
        .buttonStyle(.plain)
        .contextMenu {
            Button {
                appState.toggleFavorite(match.drink)
                HapticService.success()
            } label: {
                Label(
                    appState.isFavorite(match.drink) ? "Remover dos favoritos" : "Favoritar",
                    systemImage: appState.isFavorite(match.drink) ? "heart.slash" : "heart"
                )
            }

            ShareLink(item: shareText) {
                Label("Compartilhar", systemImage: "square.and.arrow.up")
            }

            NavigationLink {
                PreparationView(drink: match.drink)
            } label: {
                Label("Preparar agora", systemImage: "wineglass.fill")
            }
        } preview: {
            previewContent
        }
    }

    private var cardContent: some View {
        VStack(alignment: .leading, spacing: 14) {
            ZStack(alignment: .topTrailing) {
                DrinkImageView(
                    imageName: match.drink.imageName,
                    drinkName: match.drink.name
                )
                .frame(height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .applyMatchedTransitionSource(
                    id: match.drink.id,
                    namespace: namespace
                )

                Button {
                    appState.toggleFavorite(match.drink)
                    HapticService.success()
                } label: {
                    Image(systemName: appState.isFavorite(match.drink) ? "heart.fill" : "heart")
                        .font(.headline)
                        .foregroundStyle(DrinkColors.accent)
                        .padding(10)
                        .background(.black.opacity(0.45))
                        .clipShape(Circle())
                        .symbolEffect(.bounce, value: appState.isFavorite(match.drink))
                }
                .buttonStyle(.plain)
                .padding(10)
            }

            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(match.drink.name)
                        .font(.headline.weight(.semibold))
                        .foregroundStyle(DrinkColors.textPrimary)

                    Text(match.drink.description)
                        .font(.subheadline)
                        .foregroundStyle(DrinkColors.textSecondary)
                        .lineLimit(2)
                }

                Spacer()

                MatchBadge(percentage: match.matchPercentage)
            }

            HStack(spacing: 8) {
                Label(match.drink.difficulty.rawValue, systemImage: "star.fill")
                Label(match.drink.alcoholicLevel.rawValue, systemImage: "drop.fill")
            }
            .font(.caption)
            .foregroundStyle(DrinkColors.textSecondary)

            if !match.missingIngredients.isEmpty {
                Text("Falta: \(match.missingIngredients.joined(separator: ", "))")
                    .font(.caption)
                    .foregroundStyle(DrinkColors.textSecondary)
            } else {
                Text("Você tem tudo para preparar agora")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(DrinkColors.success)
            }
        }
        .padding(18)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private var previewContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            DrinkImageView(
                imageName: match.drink.imageName,
                drinkName: match.drink.name
            )
            .frame(height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))

            Text(match.drink.name)
                .font(.title2.bold())

            Text(match.drink.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("\(match.matchPercentage)% de match")
                .font(.headline)
        }
        .padding()
        .frame(width: 320)
    }

    private var shareText: String {
        let ingredients = match.drink.ingredients
            .map {
                "- \(formattedAmount($0.amount)) \($0.unit.rawValue) \($0.name)"
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

        Ingredientes:
        \(ingredients)

        Modo de preparo:
        \(instructions)

        Criado no Make Your Drink.
        """
    }

    private func formattedAmount(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(value))
        }

        return String(format: "%.1f", value)
    }
}
