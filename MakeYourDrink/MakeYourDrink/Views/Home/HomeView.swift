//
//  HomeView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        NavigationStack {
            ZStack {
                DrinkColors.background
                    .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 28) {
                        premiumHeader
                        featuredBanner
                        drinkOfTheDaySection
                        searchButton
                        shoppingListButton
                        scanCard
                        myBarSection
                        if hasAnyMatches {
                            suggestionsSection
                        } else {
                            emptyState
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 32)
                }
            }
        }
    }
    
    private var hasAnyMatches: Bool {
        !appState.matches.isEmpty
    }

    private var shoppingListButton: some View {
        NavigationLink {
            ShoppingListView()
        } label: {
            HStack {
                Image(systemName: "cart.fill")
                Text("Lista de Compras Inteligente")

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption)
            }
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(DrinkColors.accent)
            .padding(16)
            .background(DrinkColors.card)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
        .buttonStyle(.plain)
    }
    
    private var scanCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(systemName: "camera.viewfinder")
                .font(.system(size: 32, weight: .semibold))
                .foregroundStyle(DrinkColors.accent)

            VStack(alignment: .leading, spacing: 6) {
                Text("Escaneie seus ingredientes")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(DrinkColors.textPrimary)

                Text("Tire uma foto da bancada, geladeira ou bar e descubra o que preparar.")
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
            }

            NavigationLink {
                IngredientInputView()
            } label: {
                Text("Começar scan")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(DrinkColors.accent)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 16,
                            style: .continuous
                        )
                    )
            }
        }
        .padding(20)
        .background(
            LinearGradient(
                colors: [
                    DrinkColors.cardSecondary,
                    DrinkColors.card
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
    }

    private var myBarSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Seu bar agora")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            if appState.userIngredients.isEmpty {
                Text("Adicione ingredientes no Meu Bar para receber sugestões.")
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
                    .padding(18)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(DrinkColors.card)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(appState.userIngredients) { ingredient in
                            IngredientPill(name: ingredient.name)
                        }
                    }
                }
            }
        }
    }

    private var suggestionsSection: some View {
        VStack(alignment: .leading, spacing: 28) {
            
            if !recommendedForYou.isEmpty {
                section(
                    title: "✨ Recomendado para você",
                    matches: recommendedForYou
                )
            }

            if !readyNow.isEmpty {
                section(
                    title: "🍸 Dá para fazer agora",
                    matches: readyNow
                )
            }

            if !almostReady.isEmpty {
                section(
                    title: "🛒 Falta apenas 1 ingrediente",
                    matches: almostReady
                )
            }

            if !discoverMore.isEmpty {
                section(
                    title: "✨ Quase lá",
                    matches: discoverMore
                )
            }
        }
    }
    
    private func section(
        title: String,
        matches: [DrinkMatch]
    ) -> some View {

        VStack(alignment: .leading, spacing: 14) {

            Text(title)
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            VStack(spacing: 14) {
                ForEach(matches.prefix(3)) { match in
                    DrinkCard(match: match)
                }
            }
        }
    }
    
    private var recommendedForYou: [DrinkMatch] {
        appState.matches.filter { match in
            let matchesBase = match.drink.ingredients.contains { ingredient in
                appState.preferences.favoriteBases.contains(ingredient.name)
            }

            let matchesAlcoholLevel: Bool = {
                switch appState.preferences.preferredAlcoholLevel {
                case .low:
                    return match.drink.alcoholicLevel == .low
                case .medium:
                    return match.drink.alcoholicLevel == .medium
                case .high:
                    return match.drink.alcoholicLevel == .high
                }
            }()

            return matchesBase || matchesAlcoholLevel
        }
    }

    private var readyNow: [DrinkMatch] {
        appState.matches.filter { match in
            match.matchPercentage == 100 &&
            !recommendedForYou.contains(where: { $0.drink.id == match.drink.id })
        }
    }

    private var almostReady: [DrinkMatch] {
        appState.matches.filter { match in
            match.missingIngredients.count == 1 &&
            match.matchPercentage < 100 &&
            !recommendedForYou.contains(where: { $0.drink.id == match.drink.id }) &&
            !readyNow.contains(where: { $0.drink.id == match.drink.id })
        }
    }

    private var discoverMore: [DrinkMatch] {
        appState.matches.filter { match in
            match.matchPercentage >= 50 &&
            match.matchPercentage < 100 &&
            !recommendedForYou.contains(where: { $0.drink.id == match.drink.id }) &&
            !readyNow.contains(where: { $0.drink.id == match.drink.id }) &&
            !almostReady.contains(where: { $0.drink.id == match.drink.id })
        }
    }
    
    private var availableDrinksCount: Int {
        appState.matches.filter {
            $0.matchPercentage == 100
        }.count
    }

    private var ingredientCount: Int {
        appState.userIngredients.count
    }
    
    private var premiumHeader: some View {
        VStack(alignment: .leading, spacing: 16) {

            VStack(alignment: .leading, spacing: 4) {

                Text("Olá 👋")
                    .font(.title3)
                    .foregroundStyle(
                        DrinkColors.textSecondary
                    )

                Text("Vamos criar algo incrível hoje?")
                    .font(.largeTitle.bold())
                    .foregroundStyle(
                        DrinkColors.textPrimary
                    )
            }

            HStack(spacing: 12) {

                statCard(
                    icon: "shippingbox.fill",
                    value: "\(ingredientCount)",
                    title: "Ingredientes"
                )

                statCard(
                    icon: "wineglass.fill",
                    value: "\(availableDrinksCount)",
                    title: "Disponíveis"
                )
            }
        }
    }
    
    private func statCard(
        icon: String,
        value: String,
        title: String
    ) -> some View {

        VStack(
            alignment: .leading,
            spacing: 10
        ) {

            Image(systemName: icon)
                .foregroundStyle(
                    DrinkColors.accent
                )

            Text(value)
                .font(.title.bold())
                .foregroundStyle(
                    DrinkColors.textPrimary
                )

            Text(title)
                .font(.caption)
                .foregroundStyle(
                    DrinkColors.textSecondary
                )
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            DrinkColors.card
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 22,
                style: .continuous
            )
        )
    }
    
    private var featuredDrink: DrinkMatch? {
        appState.matches.max {
            $0.matchPercentage < $1.matchPercentage
        }
    }
    
    private var featuredBanner: some View {

        Group {

            if let featuredDrink {

                NavigationLink {

                    DrinkDetailView(
                        match: featuredDrink
                    )

                } label: {

                    ZStack {

                        LinearGradient(
                            colors: [
                                DrinkColors.accent.opacity(0.8),
                                DrinkColors.accent.opacity(0.4)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )

                        HStack {

                            VStack(
                                alignment: .leading,
                                spacing: 8
                            ) {

                                Text("🍸 Drink da Semana")
                                    .font(.caption.bold())

                                Text(
                                    featuredDrink.drink.name
                                )
                                .font(.title.bold())

                                Text(
                                    "\(featuredDrink.matchPercentage)% de Match"
                                )
                                .font(.subheadline)
                            }

                            Spacer()

                            Image(
                                systemName: "sparkles"
                            )
                            .font(.largeTitle)
                        }
                        .padding()
                    }
                    .frame(height: 140)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 28,
                            style: .continuous
                        )
                    )
                }
                .buttonStyle(.plain)
            }
        }
    }
    
    private var emptyState: some View {
        VStack(spacing: 20) {

            Image(systemName: "wineglass")
                .font(.system(size: 50))
                .foregroundStyle(DrinkColors.accent)

            VStack(spacing: 8) {
                Text("Seu bar está começando")
                    .font(.title3.bold())
                    .foregroundStyle(DrinkColors.textPrimary)

                Text("Adicione mais ingredientes para desbloquear receitas e recomendações.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(DrinkColors.textSecondary)
            }

            NavigationLink {
                IngredientInputView()
            } label: {
                Text("Adicionar Ingredientes")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(DrinkColors.accent)
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 16,
                            style: .continuous
                        )
                    )
            }
        }
        .padding(24)
        .background(DrinkColors.card)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 28,
                style: .continuous
            )
        )
    }

    private var searchButton: some View {
        NavigationLink {
            SearchView()
        } label: {
            HStack {
                Image(systemName: "magnifyingglass")
                Text("Pesquisar drinks")

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption)
            }
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(DrinkColors.accent)
            .padding(16)
            .background(DrinkColors.card)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
        .buttonStyle(.plain)
    }
    
    private var drinkOfTheDay: DrinkMatch? {
        DrinkOfTheDayService.drink(
            from: appState.matches
        )
    }
    
    private var drinkOfTheDaySection: some View {

        Group {

            if let drink = drinkOfTheDay {

                NavigationLink {

                    DrinkDetailView(match: drink)

                } label: {

                    VStack(alignment: .leading, spacing: 14) {

                        HStack {

                            VStack(
                                alignment: .leading,
                                spacing: 4
                            ) {

                                Text("🍸 Drink do Dia")
                                    .font(.caption.weight(.bold))
                                    .foregroundStyle(.white.opacity(0.8))

                                Text(drink.drink.name)
                                    .font(.title2.bold())
                                    .foregroundStyle(.white)

                                Text(
                                    "Você possui \(drink.matchPercentage)% dos ingredientes."
                                )
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.85))
                            }

                            Spacer()

                            DrinkImageView(
                                imageName: drink.drink.imageName,
                                drinkName: drink.drink.name
                            )
                            .frame(width: 90, height: 90)
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 20,
                                    style: .continuous
                                )
                            )
                        }
                    }
                    .padding(20)
                    .background(
                        LinearGradient(
                            colors: [
                                DrinkColors.accent,
                                DrinkColors.accent.opacity(0.65)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 28,
                            style: .continuous
                        )
                    )
                }
                .buttonStyle(.plain)
            }
        }
    }
}
