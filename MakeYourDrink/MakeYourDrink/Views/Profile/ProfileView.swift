//
//  ProfileView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        NavigationStack {
            ZStack {
                DrinkColors.background
                    .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        header
                        userCard
                        preferencesSection
                        myAIDrinksButton
                        editPreferencesButton
                        premiumSection
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 32)
                }
            }
            .navigationTitle("Perfil")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Sua experiência")
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Suas preferências ajudam o app a recomendar drinks melhores.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    private var userCard: some View {
        HStack(spacing: 14) {
            Circle()
                .fill(DrinkColors.cardSecondary)
                .frame(width: 64, height: 64)
                .overlay {
                    Image(systemName: "person.fill")
                        .font(.title2)
                        .foregroundStyle(DrinkColors.accent)
                }

            VStack(alignment: .leading, spacing: 4) {
                Text("Bartender iniciante")
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)

                Text("\(appState.favoriteDrinkIDs.count) drink\(appState.favoriteDrinkIDs.count == 1 ? "" : "s") favorito\(appState.favoriteDrinkIDs.count == 1 ? "" : "s")")
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
            }

            Spacer()
        }
        .padding(18)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private var preferencesSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Preferências")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            VStack(spacing: 10) {
                profileRow(
                    icon: "wineglass.fill",
                    title: "Bases favoritas",
                    value: appState.preferences.favoriteBases.isEmpty
                        ? "Não definido"
                        : appState.preferences.favoriteBases.joined(separator: ", ")
                )

                profileRow(
                    icon: "leaf.fill",
                    title: "Sabores favoritos",
                    value: appState.preferences.favoriteFlavors.isEmpty
                        ? "Não definido"
                        : appState.preferences.favoriteFlavors.joined(separator: ", ")
                )

                profileRow(
                    icon: "drop.fill",
                    title: "Teor alcoólico",
                    value: appState.preferences.preferredAlcoholLevel.rawValue
                )
            }
        }
    }

    private var premiumSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Make Your Drink Premium")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            VStack(alignment: .leading, spacing: 16) {
                Image(systemName: "crown.fill")
                    .font(.system(size: 30))
                    .foregroundStyle(DrinkColors.accent)

                Text("Desbloqueie o AI Bartender")
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)

                Text("Crie drinks personalizados, escaneie ingredientes ilimitados e receba sugestões baseadas no seu gosto.")
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)

                Button {
                    // Futuro: paywall
                } label: {
                    Text("Ver Premium")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(DrinkColors.accent)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
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
    }

    private func profileRow(
        icon: String,
        title: String,
        value: String
    ) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(DrinkColors.accent)
                .frame(width: 24)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .foregroundStyle(DrinkColors.textPrimary)

                Text(value)
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
                    .lineLimit(2)
            }

            Spacer()
        }
        .padding(16)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
    
    private var editPreferencesButton: some View {
        NavigationLink {
            EditPreferencesView()
        } label: {
            Text("Editar Preferências")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(DrinkColors.accent)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
    }
    
    private var myAIDrinksButton: some View {

        NavigationLink {

            SavedAIDrinksView()

        } label: {

            HStack {

                Image(systemName: "sparkles")

                Text("Meus Drinks AI")

                Spacer()

                Text(
                    "\(appState.savedAISuggestions.count)"
                )
                .foregroundStyle(
                    DrinkColors.textSecondary
                )
            }
            .padding(16)
            .background(
                DrinkColors.card
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 18,
                    style: .continuous
                )
            )
        }
        .buttonStyle(.plain)
    }
}
