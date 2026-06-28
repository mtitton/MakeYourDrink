//
//  OnboardingView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var appState: AppState

    let onFinish: () -> Void

    @State private var currentPage = 0
    @State private var selectedBases: Set<String> = []
    @State private var selectedFlavors: Set<String> = []
    @State private var selectedAlcoholLevel: AlcoholicLevelPreference = .medium

    private let pages: [OnboardingPage] = [
        .init(
            icon: "wineglass.fill",
            title: "Seu bartender pessoal",
            subtitle: "Descubra drinks com base nos ingredientes que você já tem em casa."
        ),
        .init(
            icon: "shippingbox.fill",
            title: "Monte seu bar",
            subtitle: "Adicione seus ingredientes e veja automaticamente o que você pode preparar."
        ),
        .init(
            icon: "wand.and.sparkles",
            title: "Personalize sua experiência",
            subtitle: "Escolha seus gostos para melhorar as recomendações da IA."
        )
    ]

    private var isLastPage: Bool {
        currentPage == pages.count - 1
    }

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            VStack(spacing: 20) {
                TabView(selection: $currentPage) {
                    ForEach(Array(pages.enumerated()), id: \.offset) { index, page in
                        if index == pages.count - 1 {
                            preferencesPage(page)
                                .tag(index)
                        } else {
                            pageView(page)
                                .tag(index)
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))

                pageIndicator

                actionButton
                    .padding(.horizontal, 20)
                    .padding(.bottom, 28)
            }
        }
    }

    private func pageView(_ page: OnboardingPage) -> some View {
        VStack(spacing: 30) {
            Spacer()

            ZStack {
                Circle()
                    .fill(DrinkColors.cardSecondary)
                    .frame(width: 150, height: 150)

                Image(systemName: page.icon)
                    .font(.system(size: 62, weight: .semibold))
                    .foregroundStyle(DrinkColors.accent)
                    .symbolEffect(.pulse)
            }
            .scaleOnAppear()

            VStack(spacing: 12) {
                Text(page.title)
                    .font(.largeTitle.bold())
                    .foregroundStyle(DrinkColors.textPrimary)
                    .multilineTextAlignment(.center)

                Text(page.subtitle)
                    .font(.body)
                    .foregroundStyle(DrinkColors.textSecondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .padding(.horizontal, 28)
            }

            Spacer()
        }
        .padding(20)
    }

    private func preferencesPage(_ page: OnboardingPage) -> some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                VStack(spacing: 20) {
                    ZStack {
                        Circle()
                            .fill(DrinkColors.cardSecondary)
                            .frame(width: 120, height: 120)

                        Image(systemName: page.icon)
                            .font(.system(size: 48, weight: .semibold))
                            .foregroundStyle(DrinkColors.accent)
                            .symbolEffect(.pulse)
                    }

                    Text(page.title)
                        .font(.largeTitle.bold())
                        .foregroundStyle(DrinkColors.textPrimary)
                        .multilineTextAlignment(.center)

                    Text(page.subtitle)
                        .font(.body)
                        .foregroundStyle(DrinkColors.textSecondary)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 28)

                PremiumCard {
                    preferenceSection(
                        title: "Bases favoritas",
                        options: ["Gin", "Vodka", "Rum", "Cachaça", "Whisky", "Tequila"],
                        selection: $selectedBases
                    )
                }

                PremiumCard {
                    preferenceSection(
                        title: "Sabores favoritos",
                        options: ["Cítrico", "Doce", "Refrescante", "Frutado", "Amargo"],
                        selection: $selectedFlavors
                    )
                }

                PremiumCard {
                    alcoholLevelSection
                }

                Spacer(minLength: 90)
            }
            .padding(20)
        }
    }

    private func preferenceSection(
        title: String,
        options: [String],
        selection: Binding<Set<String>>
    ) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            Text(title)
                .font(.headline)
                .foregroundStyle(DrinkColors.textPrimary)

            FlowLayout(spacing: 10) {
                ForEach(options, id: \.self) { option in
                    let isSelected = selection.wrappedValue.contains(option)

                    Button {
                        withAnimation(.spring(response: 0.25, dampingFraction: 0.82)) {
                            if isSelected {
                                selection.wrappedValue.remove(option)
                            } else {
                                selection.wrappedValue.insert(option)
                            }
                        }

                        HapticService.light()
                    } label: {
                        Text(option)
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(isSelected ? .black : DrinkColors.textPrimary)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 9)
                            .background(isSelected ? DrinkColors.accent : DrinkColors.cardSecondary)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(PremiumButtonStyle())
                }
            }
        }
    }

    private var alcoholLevelSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Teor alcoólico preferido")
                .font(.headline)
                .foregroundStyle(DrinkColors.textPrimary)

            HStack(spacing: 10) {
                ForEach(AlcoholicLevelPreference.allCases) { level in
                    Button {
                        withAnimation(.spring(response: 0.25, dampingFraction: 0.82)) {
                            selectedAlcoholLevel = level
                        }

                        HapticService.light()
                    } label: {
                        Text(level.rawValue)
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(selectedAlcoholLevel == level ? .black : DrinkColors.textPrimary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(selectedAlcoholLevel == level ? DrinkColors.accent : DrinkColors.cardSecondary)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(PremiumButtonStyle())
                }
            }
        }
    }

    private var pageIndicator: some View {
        HStack(spacing: 8) {
            ForEach(pages.indices, id: \.self) { index in
                Capsule()
                    .fill(index == currentPage ? DrinkColors.accent : DrinkColors.cardSecondary)
                    .frame(width: index == currentPage ? 28 : 8, height: 8)
                    .animation(.spring(response: 0.3, dampingFraction: 0.8), value: currentPage)
            }
        }
    }

    private var actionButton: some View {
        Button {
            if isLastPage {
                savePreferences()
                HapticService.success()
                onFinish()
            } else {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.85)) {
                    currentPage += 1
                }

                HapticService.light()
            }
        } label: {
            Text(isLastPage ? "Começar" : "Continuar")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(DrinkColors.accent)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        .buttonStyle(PremiumButtonStyle())
    }

    private func savePreferences() {
        appState.preferences = UserPreferences(
            favoriteBases: Array(selectedBases),
            favoriteFlavors: Array(selectedFlavors),
            preferredAlcoholLevel: selectedAlcoholLevel
        )
    }
}
