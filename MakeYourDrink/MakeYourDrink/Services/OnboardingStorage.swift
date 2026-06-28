//
//  OnboardingStorage.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import Foundation

enum OnboardingStorage {
    private static let key = "make_your_drink_has_seen_onboarding"

    static var hasSeenOnboarding: Bool {
        UserDefaults.standard.bool(forKey: key)
    }

    static func complete() {
        UserDefaults.standard.set(true, forKey: key)
    }

    static func reset() {
        UserDefaults.standard.set(false, forKey: key)
    }
}
