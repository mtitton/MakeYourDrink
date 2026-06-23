//
//  ProfileView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct ProfileView: View {
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

            Text("Personalize o app para receber sugestões melhores.")
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

                Text("12 drinks descobertos")
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
                    icon: "sparkles",
                    title: "Nível de experiência",
                    value: "Iniciante"
                )

                profileRow(
                    icon: "drop.fill",
                    title: "Teor alcoólico preferido",
                    value: "Médio"
                )

                profileRow(
                    icon: "leaf.fill",
                    title: "Sabores favoritos",
                    value: "Cítrico"
                )

                profileRow(
                    icon: "globe.europe.africa.fill",
                    title: "Drinks do mundo",
                    value: "Ativado"
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

            Text(title)
                .foregroundStyle(DrinkColors.textPrimary)

            Spacer()

            Text(value)
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(DrinkColors.textSecondary)
        }
        .padding(16)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}
