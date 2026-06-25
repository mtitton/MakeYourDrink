//
//  DrinkWizardView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 25/06/26.
//

import SwiftUI

struct DrinkWizardView: View {
    @EnvironmentObject private var appState: AppState
    @Environment(\.dismiss) private var dismiss

    let onFinish: (String) -> Void

    @State private var request = DrinkWizardRequest()
    @State private var step = 0

    private let totalSteps = 6

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 24) {
                progress

                content

                Spacer()

                nextButton
            }
            .padding(20)
        }
        .navigationTitle("Drink Wizard")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var progress: some View {
        VStack(alignment: .leading, spacing: 8) {
            ProgressView(value: Double(step + 1), total: Double(totalSteps))
                .tint(DrinkColors.accent)

            Text("Passo \(step + 1) de \(totalSteps)")
                .font(.caption)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    @ViewBuilder
    private var content: some View {
        switch step {
        case 0:
            optionStep(
                title: "O que você quer beber hoje?",
                subtitle: "Escolha o estilo do drink.",
                options: DrinkWizardMood.allCases,
                selection: $request.mood
            )

        case 1:
            optionStep(
                title: "Qual base você prefere?",
                subtitle: "Escolha o destilado principal.",
                options: DrinkWizardBase.allCases,
                selection: $request.base
            )

        case 2:
            optionStep(
                title: "Qual intensidade?",
                subtitle: "Escolha o perfil alcoólico.",
                options: DrinkWizardIntensity.allCases,
                selection: $request.intensity
            )

        case 3:
            optionStep(
                title: "Qual ocasião?",
                subtitle: "Isso ajuda a criar uma receita mais adequada.",
                options: DrinkWizardOccasion.allCases,
                selection: $request.occasion
            )
            
        case 4:
            fruitsStep

        default:
            finalStep
        }
    }

    private func optionStep<T: RawRepresentable & CaseIterable & Identifiable & Hashable>(
        title: String,
        subtitle: String,
        options: [T],
        selection: Binding<T?>
    ) -> some View where T.RawValue == String {
        VStack(alignment: .leading, spacing: 18) {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.largeTitle.bold())
                    .foregroundStyle(DrinkColors.textPrimary)

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
            }

            VStack(spacing: 12) {
                ForEach(options, id: \.id) { option in
                    Button {
                        selection.wrappedValue = option
                        HapticService.light()
                    } label: {
                        HStack {
                            Text(option.rawValue)
                                .font(.headline)
                                .foregroundStyle(DrinkColors.textPrimary)

                            Spacer()

                            Image(systemName: selection.wrappedValue == option ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(selection.wrappedValue == option ? DrinkColors.accent : DrinkColors.textSecondary)
                        }
                        .padding(16)
                        .background(DrinkColors.card)
                        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var finalStep: some View {
        VStack(alignment: .leading, spacing: 22) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Últimos detalhes")
                    .font(.largeTitle.bold())
                    .foregroundStyle(DrinkColors.textPrimary)

                Text("Ajuste para quantas pessoas e se a IA pode sugerir ingredientes que você ainda não tem.")
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
            }

            VStack(alignment: .leading, spacing: 14) {
                Text("Pessoas")
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)

                HStack(spacing: 10) {
                    ForEach([1, 2, 4, 6], id: \.self) { value in
                        Button {
                            request.servings = value
                            HapticService.light()
                        } label: {
                            Text(value == 1 ? "1" : "\(value)")
                                .font(.headline)
                                .foregroundStyle(request.servings == value ? .black : DrinkColors.textPrimary)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(request.servings == value ? DrinkColors.accent : DrinkColors.card)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        }
                        .buttonStyle(.plain)
                    }
                }
            }

            Toggle(isOn: $request.allowMissingIngredients) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Pode sugerir ingredientes que não tenho")
                        .foregroundStyle(DrinkColors.textPrimary)

                    Text("Útil para criar drinks mais completos.")
                        .font(.caption)
                        .foregroundStyle(DrinkColors.textSecondary)
                }
            }
            .tint(DrinkColors.accent)
            .padding(16)
            .background(DrinkColors.card)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
    }

    private var nextButton: some View {
        Button {
            if step < totalSteps - 1 {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                    step += 1
                }
                HapticService.light()
            } else {
                let prompt = DrinkWizardService.prompt(
                    from: request,
                    userIngredients: appState.userIngredients
                )

                HapticService.success()
                onFinish(prompt)
                dismiss()
            }
        } label: {
            Text(step == totalSteps - 1 ? "Criar drink" : "Continuar")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(canContinue ? DrinkColors.accent : DrinkColors.textSecondary)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        .disabled(!canContinue)
    }

    private var canContinue: Bool {
        switch step {
        case 0:
            return request.mood != nil
        case 1:
            return request.base != nil
        case 2:
            return request.intensity != nil
        case 3:
            return request.occasion != nil
        case 4:
            return !request.fruits.isEmpty
        default:
            return true
        }
    }
    
    private var fruitsStep: some View {
        VStack(alignment: .leading, spacing: 18) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Quer usar alguma fruta?")
                    .font(.largeTitle.bold())
                    .foregroundStyle(DrinkColors.textPrimary)

                Text("Escolha uma ou mais opções para guiar a receita.")
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
            }

            VStack(spacing: 12) {
                ForEach(DrinkWizardFruit.allCases) { fruit in
                    Button {
                        if fruit == .any {
                            request.fruits = [.any]
                        } else {
                            request.fruits.removeAll { $0 == .any }

                            if request.fruits.contains(fruit) {
                                request.fruits.removeAll { $0 == fruit }
                            } else {
                                request.fruits.append(fruit)
                            }
                        }

                        HapticService.light()
                    } label: {
                        HStack {
                            Text(fruit.rawValue)
                                .font(.headline)
                                .foregroundStyle(DrinkColors.textPrimary)

                            Spacer()

                            Image(systemName: request.fruits.contains(fruit) ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(request.fruits.contains(fruit) ? DrinkColors.accent : DrinkColors.textSecondary)
                        }
                        .padding(16)
                        .background(DrinkColors.card)
                        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}
