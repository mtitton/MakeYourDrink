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
                        FadeInView(delay: 0.00) {
                            header
                        }

                        FadeInView(delay: 0.05) {
                            userCard
                        }

                        FadeInView(delay: 0.10) {
                            ProfileStatsView()
                        }

                        FadeInView(delay: 0.15) {
                            achievementsButton
                        }

                        FadeInView(delay: 0.20) {
                            historyButton
                        }

                        FadeInView(delay: 0.25) {
                            preferencesSection
                        }

                        FadeInView(delay: 0.30) {
                            myAIDrinksButton
                        }

                        FadeInView(delay: 0.35) {
                            editPreferencesButton
                        }

                        FadeInView(delay: 0.40) {
                            aboutButton
                        }

//                        FadeInView(delay: 0.45) {
//                            premiumSection
//                        }
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
        PremiumCard {
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
        }
        .scaleOnAppear()
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

            PremiumCard {
                VStack(alignment: .leading, spacing: 16) {
                    Image(systemName: "crown.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(DrinkColors.accent)
                        .symbolEffect(.pulse)

                    Text("Desbloqueie a IA Bartender")
                        .font(.headline)
                        .foregroundStyle(DrinkColors.textPrimary)

                    Text("Crie drinks personalizados, escaneie ingredientes ilimitados e receba sugestões baseadas no seu gosto.")
                        .font(.subheadline)
                        .foregroundStyle(DrinkColors.textSecondary)

                    NavigationLink {
                        PremiumView()
                    } label: {
                        Text("Ver Premium")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(DrinkColors.accent)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    }
                    .buttonStyle(PremiumButtonStyle())
                }
            }
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
        .overlay {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .strokeBorder(Color.white.opacity(0.05), lineWidth: 1)
        }
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
        .buttonStyle(PremiumButtonStyle())
    }

    private var myAIDrinksButton: some View {
        premiumRowButton(
            icon: "sparkles",
            title: "Meus Drinks IA",
            value: "\(appState.savedAISuggestions.count)"
        ) {
            SavedAIDrinksView()
        }
    }

    private var historyButton: some View {
        premiumRowButton(
            icon: "clock.arrow.circlepath",
            title: "Últimos preparados",
            value: "\(appState.drinkHistory.count)"
        ) {
            DrinkHistoryView()
        }
    }

    private var aboutButton: some View {
        premiumRowButton(
            icon: "info.circle.fill",
            title: "Sobre o App",
            value: nil
        ) {
            AboutView()
        }
    }

    private var achievementsButton: some View {
        premiumRowButton(
            icon: "trophy.fill",
            title: "Conquistas",
            value: nil
        ) {
            AchievementsView()
        }
    }

    private func premiumRowButton<Destination: View>(
        icon: String,
        title: String,
        value: String?,
        @ViewBuilder destination: @escaping () -> Destination
    ) -> some View {
        NavigationLink {
            destination()
        } label: {
            HStack(spacing: 14) {
                Image(systemName: icon)
                    .foregroundStyle(DrinkColors.accent)
                    .frame(width: 24)

                Text(title)
                    .foregroundStyle(DrinkColors.textPrimary)

                Spacer()

                if let value {
                    Text(value)
                        .foregroundStyle(DrinkColors.textSecondary)
                }

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
}
