//
//  HapticService.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import UIKit

enum HapticService {
    static func light() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }

    static func medium() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }

    static func success() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
}
