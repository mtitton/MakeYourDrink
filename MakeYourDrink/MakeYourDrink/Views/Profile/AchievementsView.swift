//
//  AchievementsView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct AchievementsView: View {

    @EnvironmentObject private var appState: AppState

    private var achievements: [Achievement] {
        AchievementService.achievements(
            appState: appState
        )
    }

    var body: some View {

        ZStack {

            DrinkColors.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                LazyVStack(spacing: 14) {

                    ForEach(achievements) { achievement in

                        achievementCard(
                            achievement
                        )
                    }
                }
                .padding(20)
            }
        }
        .navigationTitle("Conquistas")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func achievementCard(
        _ achievement: Achievement
    ) -> some View {

        HStack(spacing: 14) {

            Image(systemName: achievement.icon)
                .font(.title2)
                .foregroundStyle(
                    achievement.unlocked
                    ? DrinkColors.accent
                    : .gray
                )

            VStack(
                alignment: .leading,
                spacing: 4
            ) {

                Text(achievement.title)
                    .font(.headline)
                    .foregroundStyle(
                        DrinkColors.textPrimary
                    )

                Text(
                    achievement.description
                )
                .font(.caption)
                .foregroundStyle(
                    DrinkColors.textSecondary
                )
            }

            Spacer()

            Image(
                systemName: achievement.unlocked
                ? "checkmark.circle.fill"
                : "lock.fill"
            )
            .foregroundStyle(
                achievement.unlocked
                ? .green
                : .gray
            )
        }
        .padding(16)
        .background(
            DrinkColors.card
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 20,
                style: .continuous
            )
        )
    }
}
