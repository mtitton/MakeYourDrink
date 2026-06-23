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
    @State private var splashFinished = false

    var body: some Scene {
        WindowGroup {
            if !splashFinished {
                SplashView(isFinished: $splashFinished)
                    .preferredColorScheme(.dark)
            } else if hasSeenOnboarding {
                MainTabView()
                    .environmentObject(appState)
                    .preferredColorScheme(.dark)
            } else {
                OnboardingView {
                    OnboardingStorage.complete()
                    hasSeenOnboarding = true
                }
                .environmentObject(appState)
                .preferredColorScheme(.dark)
            }
        }
    }
}
