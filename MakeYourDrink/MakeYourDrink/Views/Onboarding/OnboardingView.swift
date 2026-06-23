//
//  OnboardingView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct OnboardingView: View {

    let onFinish: () -> Void

    @State private var currentPage = 0

    private let pages: [OnboardingPage] = [
        .init(
            image: "wineglass.fill",
            title: "Transforme ingredientes em drinks",
            subtitle: "Descubra receitas incríveis com o que você já tem em casa."
        ),
        .init(
            image: "camera.viewfinder",
            title: "Escaneie, escreva ou selecione",
            subtitle: "Adicione ingredientes da forma mais conveniente para você."
        ),
        .init(
            image: "sparkles",
            title: "Seu bartender inteligente",
            subtitle: "Receba sugestões personalizadas e encontre o drink perfeito."
        )
    ]

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            VStack {
                TabView(selection: $currentPage) {

                    ForEach(Array(pages.enumerated()), id: \.offset) { index, page in
                        pageView(page)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))

                Button {
                    if currentPage < pages.count - 1 {
                        currentPage += 1
                    } else {
                        onFinish()
                    }
                } label: {
                    Text(currentPage == pages.count - 1 ? "Começar" : "Próximo")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(DrinkColors.accent)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 18,
                                style: .continuous
                            )
                        )
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
    }

    private func pageView(_ page: OnboardingPage) -> some View {
        VStack(spacing: 30) {

            Spacer()

            Image(systemName: page.image)
                .font(.system(size: 80))
                .foregroundStyle(DrinkColors.accent)

            Text(page.title)
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)
                .multilineTextAlignment(.center)

            Text(page.subtitle)
                .font(.title3)
                .foregroundStyle(DrinkColors.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()
        }
        .padding()
    }
}
