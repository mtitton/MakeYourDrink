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
                    heroHeader
                    descriptionSection
                    matchSection

                    RecipeMetadataCard(
                        metadata: RecipeMetadataBuilder.build(for: match.drink)
                    )

                    chatButton
                    availabilitySection
                    partyModeSection
                    ingredientsSection
                    prepareButton
                    instructionsSection
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 36)
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

    private var heroHeader: some View {
        GeometryReader { proxy in
            let width = proxy.size.width

            ZStack(alignment: .bottomLeading) {
                DrinkImageView(
                    imageName: match.drink.imageName,
                    drinkName: match.drink.name
                )
                .frame(width: width, height: 260)
                .clipped()
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 32,
                        style: .continuous
                    )
                )
                .applyMatchedTransitionSource(
                    id: match.drink.id,
                    namespace: namespace
                )

                LinearGradient(
                    colors: [
                        .clear,
                        .black.opacity(0.72)
                    ],
                    startPoint: .center,
                    endPoint: .bottom
                )
                .frame(width: width, height: 260)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 32,
                        style: .continuous
                    )
                )

                VStack(alignment: .leading, spacing: 10) {
                    Text(match.drink.name)
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .lineLimit(2)
                        .minimumScaleFactor(0.75)

                    HStack(spacing: 8) {
                        heroBadge(icon: "star.fill", text: match.drink.difficulty.rawValue)
                        heroBadge(icon: "drop.fill", text: match.drink.alcoholicLevel.rawValue)
                        heroBadge(icon: "percent", text: "\(match.matchPercentage)%")
                    }
                }
                .padding(18)
            }
            .frame(width: width, height: 260)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 32,
                    style: .continuous
                )
            )
            .shadow(
                color: .black.opacity(0.18),
                radius: 16,
                y: 8
            )
        }
        .frame(height: 260)
        .scaleOnAppear()
    }

    private func heroBadge(
        icon: String,
        text: String
    ) -> some View {
        Label(text, systemImage: icon)
            .font(.caption.weight(.semibold))
            .foregroundStyle(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(.white.opacity(0.14))
            .clipShape(Capsule())
    }

    private var descriptionSection: some View {
        FadeInView(delay: 0.00) {
            Text(match.drink.description)
                .font(.body)
                .foregroundStyle(DrinkColors.textSecondary)
                .lineSpacing(4)
        }
    }

    private var matchSection: some View {
        FadeInView(delay: 0.05) {
            PremiumCard {
                VStack(alignment: .leading, spacing: 14) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Match")
                                .font(.headline)
                                .foregroundStyle(DrinkColors.textPrimary)

                            Text(match.matchPercentage == 100 ? "Você tem tudo" : "Quase lá")
                                .font(.subheadline)
                                .foregroundStyle(DrinkColors.textSecondary)
                        }

                        Spacer()

                        Text("\(match.matchPercentage)%")
                            .font(.largeTitle.bold())
                            .foregroundStyle(DrinkColors.accent)
                    }

                    ProgressView(value: Double(match.matchPercentage), total: 100)
                        .tint(DrinkColors.accent)

                    Text(match.matchPercentage == 100 ? "Dá para preparar agora." : "Faltam poucos ingredientes para preparar.")
                        .font(.caption)
                        .foregroundStyle(DrinkColors.textSecondary)
                }
            }
        }
    }

    private var availabilitySection: some View {
        FadeInView(delay: 0.10) {
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
    }

    private func availabilityCard(
        title: String,
        value: String,
        icon: String,
        color: Color
    ) -> some View {
        PremiumCard {
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
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var partyModeSection: some View {
        FadeInView(delay: 0.15) {
            PremiumCard {
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
                                    withAnimation(.spring(response: 0.25, dampingFraction: 0.82)) {
                                        servings = option
                                    }
                                    HapticService.light()
                                } label: {
                                    Text(option == 1 ? "1 pessoa" : "\(option) pessoas")
                                        .font(.subheadline.weight(.semibold))
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 10)
                                        .background(servings == option ? DrinkColors.accent : DrinkColors.cardSecondary)
                                        .foregroundStyle(servings == option ? .black : DrinkColors.textPrimary)
                                        .clipShape(Capsule())
                                }
                                .buttonStyle(PremiumButtonStyle())
                            }
                        }
                    }
                }
            }
        }
    }

    private var ingredientsSection: some View {
        FadeInView(delay: 0.20) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Ingredientes para \(servings) pessoa\(servings == 1 ? "" : "s")")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(DrinkColors.textPrimary)

                VStack(spacing: 10) {
                    ForEach(Array(match.drink.ingredients.enumerated()), id: \.element) { index, ingredient in
                        FadeInView(delay: Double(index) * 0.03) {
                            ingredientRow(ingredient)
                        }
                    }
                }
            }
        }
    }

    private func ingredientRow(_ ingredient: DrinkIngredient) -> some View {
        let isAvailable = match.availableIngredients.contains(ingredient.name)
        let totalAmount = scaledAmount(ingredient.amount)

        return HStack(spacing: 14) {
            Image(systemName: isAvailable ? "checkmark.circle.fill" : "xmark.circle.fill")
                .font(.title3)
                .foregroundStyle(isAvailable ? DrinkColors.success : DrinkColors.danger)

            VStack(alignment: .leading, spacing: 4) {
                Text(ingredient.name)
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)

                Text("\(formattedAmount(totalAmount)) \(ingredient.unit.rawValue)")
                    .font(.caption)
                    .foregroundStyle(DrinkColors.textSecondary)
            }

            Spacer()
        }
        .padding(14)
        .background(DrinkColors.card)
        .overlay {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .strokeBorder(
                    isAvailable ? DrinkColors.success.opacity(0.18) : DrinkColors.danger.opacity(0.18),
                    lineWidth: 1
                )
        }
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var prepareButton: some View {
        FadeInView(delay: 0.25) {
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
            .buttonStyle(PremiumButtonStyle())
        }
    }

    private var instructionsSection: some View {
        FadeInView(delay: 0.30) {
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
                                .frame(width: 34, height: 34)
                                .background(DrinkColors.accent)
                                .clipShape(Circle())

                            Text(instruction)
                                .font(.body)
                                .foregroundStyle(DrinkColors.textPrimary)
                                .lineSpacing(3)

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

    private var chatButton: some View {
        FadeInView(delay: 0.12) {
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
            .buttonStyle(PremiumButtonStyle())
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
}
