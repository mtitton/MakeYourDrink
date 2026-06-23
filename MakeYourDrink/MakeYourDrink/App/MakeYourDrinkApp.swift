//
//  MakeYourDrinkApp.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

@main
struct MakeYourDrinkApp: App {

    @StateObject private var appState = AppState()
    @State private var hasSeenOnboarding = OnboardingStorage.hasSeenOnboarding

    var body: some Scene {
        WindowGroup {

            if hasSeenOnboarding {

                MainTabView()
                    .environmentObject(appState)
                    .preferredColorScheme(.dark)

            } else {

                OnboardingView {

                    OnboardingStorage.complete()

                    hasSeenOnboarding = true
                }
                .preferredColorScheme(.dark)
            }
        }
    }
}
