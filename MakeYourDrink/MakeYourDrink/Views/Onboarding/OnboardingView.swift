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
            image: "wineglass.fill",
            title: "Transforme ingredientes em drinks",
            subtitle: "Descubra receitas incríveis com o que você já tem em casa."
        ),
        .init(
            image: "camera.viewfinder",
            title: "Escaneie, escreva ou selecione",
            subtitle: "Adicione ingredientes da forma mais conveniente para você."
        ),
        .init(
            image: "sparkles",
            title: "Personalize sua experiência",
            subtitle: "Escolha alguns gostos para melhorar suas recomendações."
        )
    ]

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            VStack {
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
                .tabViewStyle(.page(indexDisplayMode: .always))

                Button {
                    if currentPage < pages.count - 1 {
                        currentPage += 1
                    } else {
                        savePreferences()
                        onFinish()
                    }
                } label: {
                    Text(currentPage == pages.count - 1 ? "Começar" : "Próximo")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(DrinkColors.accent)
                        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
    }

    private func pageView(_ page: OnboardingPage) -> some View {
        VStack(spacing: 30) {
            Spacer()

            Image(systemName: page.image)
                .font(.system(size: 80))
                .foregroundStyle(DrinkColors.accent)

            Text(page.title)
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)
                .multilineTextAlignment(.center)

            Text(page.subtitle)
                .font(.title3)
                .foregroundStyle(DrinkColors.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()
        }
        .padding()
    }

    private func preferencesPage(_ page: OnboardingPage) -> some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                VStack(spacing: 20) {
                    Image(systemName: page.image)
                        .font(.system(size: 64))
                        .foregroundStyle(DrinkColors.accent)

                    Text(page.title)
                        .font(.largeTitle.bold())
                        .foregroundStyle(DrinkColors.textPrimary)
                        .multilineTextAlignment(.center)

                    Text(page.subtitle)
                        .font(.body)
                        .foregroundStyle(DrinkColors.textSecondary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 40)

                preferenceSection(
                    title: "Bases favoritas",
                    options: ["Gin", "Vodka", "Rum", "Cachaça", "Whisky", "Tequila"],
                    selection: $selectedBases
                )

                preferenceSection(
                    title: "Sabores favoritos",
                    options: ["Cítrico", "Doce", "Refrescante", "Frutado", "Amargo"],
                    selection: $selectedFlavors
                )

                alcoholLevelSection

                Spacer(minLength: 80)
            }
            .padding(20)
        }
    }

    private func preferenceSection(
        title: String,
        options: [String],
        selection: Binding<Set<String>>
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundStyle(DrinkColors.textPrimary)

            FlowLayout(spacing: 10) {
                ForEach(options, id: \.self) { option in
                    let isSelected = selection.wrappedValue.contains(option)

                    Button {
                        if isSelected {
                            selection.wrappedValue.remove(option)
                        } else {
                            selection.wrappedValue.insert(option)
                        }
                    } label: {
                        Text(option)
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(isSelected ? .black : DrinkColors.textPrimary)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 9)
                            .background(isSelected ? DrinkColors.accent : DrinkColors.card)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var alcoholLevelSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Teor alcoólico preferido")
                .font(.headline)
                .foregroundStyle(DrinkColors.textPrimary)

            HStack(spacing: 10) {
                ForEach(AlcoholicLevelPreference.allCases) { level in
                    Button {
                        selectedAlcoholLevel = level
                    } label: {
                        Text(level.rawValue)
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(selectedAlcoholLevel == level ? .black : DrinkColors.textPrimary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(selectedAlcoholLevel == level ? DrinkColors.accent : DrinkColors.card)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private func savePreferences() {
        appState.preferences = UserPreferences(
            favoriteBases: Array(selectedBases),
            favoriteFlavors: Array(selectedFlavors),
            preferredAlcoholLevel: selectedAlcoholLevel
        )
    }
}
