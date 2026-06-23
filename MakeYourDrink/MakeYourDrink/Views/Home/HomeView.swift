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
                        header
                        scanCard
                        myBarSection
                        suggestionsSection
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 32)
                }
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Make Your Drink")
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Transforme ingredientes em drinks.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
            
            NavigationLink {
                ShoppingListView()
            } label: {
                HStack {
                    Image(systemName: "cart.fill")
                    Text("Lista de Compras Inteligente")
                }
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(DrinkColors.accent)
            }
            .buttonStyle(.plain)
            .padding(.top, 8)
        }
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
    
    private var readyNow: [DrinkMatch] {
        appState.matches.filter {
            $0.matchPercentage == 100
        }
    }

    private var almostReady: [DrinkMatch] {
        appState.matches.filter {
            $0.missingIngredients.count == 1 &&
            $0.matchPercentage < 100
        }
    }

    private var discoverMore: [DrinkMatch] {
        appState.matches.filter {
            $0.matchPercentage >= 50 &&
            $0.matchPercentage < 100
        }
    }
}
