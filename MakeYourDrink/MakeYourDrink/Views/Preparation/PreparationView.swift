//
//  PreparationView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct PreparationView: View {
    let drink: Drink

    @State private var currentStep = 0

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            VStack(spacing: 28) {
                progress

                Spacer()

                stepCard

                Spacer()

                controls
            }
            .padding(20)
        }
        .navigationTitle(drink.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var progress: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Passo \(currentStep + 1) de \(drink.instructions.count)")
                .font(.headline)
                .foregroundStyle(DrinkColors.textPrimary)

            ProgressView(
                value: Double(currentStep + 1),
                total: Double(drink.instructions.count)
            )
            .tint(DrinkColors.accent)
        }
    }

    private var stepCard: some View {
        VStack(spacing: 24) {
            Text("\(currentStep + 1)")
                .font(.system(size: 52, weight: .bold))
                .foregroundStyle(.black)
                .frame(width: 96, height: 96)
                .background(DrinkColors.accent)
                .clipShape(Circle())

            Text(drink.instructions[currentStep])
                .font(.title2.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)
                .multilineTextAlignment(.center)
        }
        .padding(28)
        .frame(maxWidth: .infinity)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
    }

    private var controls: some View {
        HStack(spacing: 12) {
            Button {
                if currentStep > 0 {
                    currentStep -= 1
                }
            } label: {
                Text("Voltar")
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(DrinkColors.card)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            .disabled(currentStep == 0)
            .opacity(currentStep == 0 ? 0.5 : 1)

            Button {
                if currentStep < drink.instructions.count - 1 {
                    currentStep += 1
                }
            } label: {
                Text(currentStep == drink.instructions.count - 1 ? "Concluir" : "Próximo")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(DrinkColors.accent)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
        }
    }
}
