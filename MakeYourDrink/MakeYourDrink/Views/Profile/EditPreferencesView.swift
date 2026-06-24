//
//  EditPreferencesView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct EditPreferencesView: View {
    @EnvironmentObject private var appState: AppState
    @Environment(\.dismiss) private var dismiss

    @State private var selectedBases: Set<String> = []
    @State private var selectedFlavors: Set<String> = []
    @State private var selectedAlcoholLevel: AlcoholicLevelPreference = .medium

    private let bases = ["Gin", "Vodka", "Rum", "Cachaça", "Whisky", "Tequila"]
    private let flavors = ["Cítrico", "Doce", "Refrescante", "Frutado", "Amargo"]

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    header

                    preferenceSection(
                        title: "Bases favoritas",
                        options: bases,
                        selection: $selectedBases
                    )

                    preferenceSection(
                        title: "Sabores favoritos",
                        options: flavors,
                        selection: $selectedFlavors
                    )

                    alcoholLevelSection

                    saveButton
                }
                .padding(20)
            }
        }
        .navigationTitle("Preferências")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            selectedBases = Set(appState.preferences.favoriteBases)
            selectedFlavors = Set(appState.preferences.favoriteFlavors)
            selectedAlcoholLevel = appState.preferences.preferredAlcoholLevel
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Ajuste suas preferências")
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Isso ajuda o app a recomendar drinks mais próximos do seu gosto.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
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

    private var saveButton: some View {
        Button {
            appState.preferences = UserPreferences(
                favoriteBases: Array(selectedBases),
                favoriteFlavors: Array(selectedFlavors),
                preferredAlcoholLevel: selectedAlcoholLevel
            )

            dismiss()
        } label: {
            Text("Salvar Preferências")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(DrinkColors.accent)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
    }
}
