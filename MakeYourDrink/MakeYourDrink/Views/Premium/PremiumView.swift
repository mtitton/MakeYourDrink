//
//  PremiumView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct PremiumView: View {
    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 28) {
                    header
                    benefits
                    plans
                    subscribeButton
                    footer
                }
                .padding(20)
            }
        }
        .navigationTitle("Premium")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 14) {
            Image(systemName: "crown.fill")
                .font(.system(size: 52))
                .foregroundStyle(DrinkColors.accent)

            Text("Make Your Drink Premium")
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Desbloqueie a experiência completa do seu bartender inteligente.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    private var benefits: some View {
        VStack(spacing: 12) {
            benefit("IA Bartender ilimitada")
            benefit("Scan ilimitado de ingredientes")
            benefit("Receitas personalizadas")
            benefit("Sugestões baseadas no seu gosto")
            benefit("Drinks exclusivos e sazonais")
        }
    }

    private func benefit(_ text: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(DrinkColors.success)

            Text(text)
                .foregroundStyle(DrinkColors.textPrimary)

            Spacer()
        }
        .padding(16)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var plans: some View {
        VStack(spacing: 14) {
            planCard(
                title: "Mensal",
                price: "R$ 9,90",
                subtitle: "Flexível, cancele quando quiser"
            )

            planCard(
                title: "Anual",
                price: "R$ 59,90",
                subtitle: "Melhor valor"
            )
        }
    }

    private func planCard(
        title: String,
        price: String,
        subtitle: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(DrinkColors.textPrimary)

            Text(price)
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.accent)

            Text(subtitle)
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }

    private var subscribeButton: some View {
        Button {
            // Futuro: StoreKit
        } label: {
            Text("Continuar")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(DrinkColors.accent)
                .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
    }

    private var footer: some View {
        Text("Em breve. A assinatura será integrada com StoreKit em uma sprint futura.")
            .font(.caption)
            .foregroundStyle(DrinkColors.textSecondary)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
    }
}
