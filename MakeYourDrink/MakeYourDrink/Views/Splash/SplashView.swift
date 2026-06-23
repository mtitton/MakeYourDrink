//
//  SplashView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct SplashView: View {
    @Binding var isFinished: Bool

    @State private var scale: CGFloat = 0.9
    @State private var opacity: Double = 0

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            VStack(spacing: 22) {
                Image("AppLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
                    .scaleEffect(scale)
                    .opacity(opacity)

                VStack(spacing: 6) {
                    Text("Make Your Drink")
                        .font(.largeTitle.bold())
                        .foregroundStyle(DrinkColors.textPrimary)

                    Text("Turn ingredients into cocktails.")
                        .font(.subheadline)
                        .foregroundStyle(DrinkColors.textSecondary)
                }
                .opacity(opacity)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.7)) {
                scale = 1
                opacity = 1
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                withAnimation(.easeInOut(duration: 0.35)) {
                    isFinished = true
                }
            }
        }
    }
}
