//
//  FadeInView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 27/06/26.
//

import SwiftUI

struct FadeInView<Content: View>: View {

    @State
    private var visible = false

    let delay: Double

    @ViewBuilder
    let content: Content

    var body: some View {

        content
            .opacity(visible ? 1 : 0)
            .offset(y: visible ? 0 : 18)
            .animation(
                .spring(
                    response: 0.45,
                    dampingFraction: 0.82
                )
                .delay(delay),
                value: visible
            )
            .onAppear {
                visible = true
            }
    }
}
