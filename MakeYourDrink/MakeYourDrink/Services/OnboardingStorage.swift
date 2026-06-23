//
//  OnboardingStorage.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

enum OnboardingStorage {

    private static let key = "has_seen_onboarding"

    static var hasSeenOnboarding: Bool {
        UserDefaults.standard.bool(forKey: key)
    }

    static func complete() {
        UserDefaults.standard.set(true, forKey: key)
    }
}
