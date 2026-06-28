//
//  PreparationView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct PreparationView: View {
    let drink: Drink

    @EnvironmentObject private var appState: AppState
    @Environment(\.dismiss) private var dismiss

    @State private var currentStep = 0
    @State private var showsRatingSheet = false

    private var isLastStep: Bool {
        currentStep == drink.instructions.count - 1
    }

    private var progress: Double {
        guard !drink.instructions.isEmpty else { return 0 }
        return Double(currentStep + 1) / Double(drink.instructions.count)
    }

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            VStack(spacing: 24) {
                FadeInView(delay: 0.00) {
                    header
                }

                FadeInView(delay: 0.05) {
                    progressCard
                }

                Spacer()

                FadeInView(delay: 0.10) {
                    stepCard
                }

                Spacer()

                FadeInView(delay: 0.15) {
                    controls
                }
            }
            .padding(20)
        }
        .navigationTitle("Preparo")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showsRatingSheet) {
            DrinkRatingSheet(drink: drink) { rating in
                appState.rateDrink(drink, rating: rating)
                dismiss()
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(drink.name)
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Siga o passo a passo para preparar seu drink.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var progressCard: some View {
        PremiumCard {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Passo \(currentStep + 1) de \(drink.instructions.count)")
                        .font(.headline)
                        .foregroundStyle(DrinkColors.textPrimary)

                    Spacer()

                    Text("\(Int(progress * 100))%")
                        .font(.caption.weight(.bold))
                        .foregroundStyle(DrinkColors.accent)
                }

                ProgressView(value: progress)
                    .tint(DrinkColors.accent)
                    .animation(.spring(response: 0.3, dampingFraction: 0.82), value: progress)
            }
        }
    }

    private var stepCard: some View {
        PremiumCard {
            VStack(spacing: 26) {
                ZStack {
                    Circle()
                        .fill(DrinkColors.accent)
                        .frame(width: 104, height: 104)
                        .shadow(
                            color: DrinkColors.accent.opacity(0.25),
                            radius: 18,
                            y: 8
                        )

                    Text("\(currentStep + 1)")
                        .font(.system(size: 52, weight: .bold))
                        .foregroundStyle(.black)
                        .contentTransition(.numericText())
                }

                Text(drink.instructions[currentStep])
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(DrinkColors.textPrimary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .id(currentStep)
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .trailing).combined(with: .opacity),
                            removal: .move(edge: .leading).combined(with: .opacity)
                        )
                    )

                if isLastStep {
                    Text("Último passo")
                        .font(.caption.weight(.bold))
                        .foregroundStyle(DrinkColors.accent)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(DrinkColors.cardSecondary)
                        .clipShape(Capsule())
                        .scaleOnAppear()
                }
            }
            .frame(maxWidth: .infinity)
            .animation(.spring(response: 0.35, dampingFraction: 0.85), value: currentStep)
        }
        .scaleOnAppear()
    }

    private var controls: some View {
        VStack(spacing: 12) {
            Button {
                advance()
            } label: {
                Text(isLastStep ? "Concluir preparo" : "Próximo passo")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(DrinkColors.accent)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            .buttonStyle(PremiumButtonStyle())

            Button {
                goBack()
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
            .opacity(currentStep == 0 ? 0.45 : 1)
            .buttonStyle(PremiumButtonStyle())
        }
    }

    private func advance() {
        if currentStep < drink.instructions.count - 1 {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                currentStep += 1
            }

            HapticService.light()
        } else {
            appState.registerPreparedDrink(drink)
            HapticService.success()
            showsRatingSheet = true
        }
    }

    private func goBack() {
        guard currentStep > 0 else { return }

        withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
            currentStep -= 1
        }

        HapticService.light()
    }
}
