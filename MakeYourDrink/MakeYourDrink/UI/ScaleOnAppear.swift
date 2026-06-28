//
//  ScaleOnAppear.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 27/06/26.
//

import SwiftUI

struct ScaleOnAppear: ViewModifier {

    @State
    private var visible = false

    func body(content: Content) -> some View {

        content
            .scaleEffect(visible ? 1 : 0.94)
            .opacity(visible ? 1 : 0)
            .animation(
                .spring(
                    response: 0.45,
                    dampingFraction: 0.82
                ),
                value: visible
            )
            .onAppear {

                visible = true

            }
    }
}

extension View {

    func scaleOnAppear() -> some View {

        modifier(
            ScaleOnAppear()
        )
    }

}
