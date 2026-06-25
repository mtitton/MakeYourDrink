//
//  DrinkRatingSheet.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct DrinkRatingSheet: View {
    let drink: Drink
    let onRate: (Int) -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var selectedRating = 5

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Image(systemName: "star.circle.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(DrinkColors.accent)

                VStack(spacing: 8) {
                    Text("Como ficou o \(drink.name)?")
                        .font(.title2.bold())
                        .foregroundStyle(DrinkColors.textPrimary)
                        .multilineTextAlignment(.center)

                    Text("Sua avaliação ajuda a melhorar recomendações futuras.")
                        .font(.subheadline)
                        .foregroundStyle(DrinkColors.textSecondary)
                        .multilineTextAlignment(.center)
                }

                HStack(spacing: 10) {
                    ForEach(1...5, id: \.self) { value in
                        Button {
                            selectedRating = value
                            HapticService.light()
                        } label: {
                            Image(systemName: value <= selectedRating ? "star.fill" : "star")
                                .font(.system(size: 34))
                                .foregroundStyle(DrinkColors.accent)
                        }
                        .buttonStyle(.plain)
                    }
                }

                Button {
                    HapticService.success()
                    onRate(selectedRating)
                    dismiss()
                } label: {
                    Text("Salvar avaliação")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(DrinkColors.accent)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                }

                Button {
                    dismiss()
                } label: {
                    Text("Agora não")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(DrinkColors.textSecondary)
                }
            }
            .padding(24)
        }
        .presentationDetents([.medium])
    }
}
