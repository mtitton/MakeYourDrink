//
//  PremiumButtonStyle.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 27/06/26.
//

import SwiftUI

struct PremiumButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {

        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1)
            .brightness(configuration.isPressed ? -0.04 : 0)
            .animation(
                .spring(
                    response: 0.22,
                    dampingFraction: 0.72
                ),
                value: configuration.isPressed
            )
    }
}
