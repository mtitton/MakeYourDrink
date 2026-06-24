//
//  AboutView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    header
                    appInfo
                    legalSection
                    footer
                }
                .padding(20)
            }
        }
        .navigationTitle("Sobre")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 72, height: 72)

            Text("Make Your Drink")
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Transforme ingredientes em drinks.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }

    private var appInfo: some View {
        VStack(spacing: 10) {
            row(title: "Versão", value: "1.0.0")
            row(title: "Idioma", value: "Português")
            row(title: "Status", value: "MVP")
        }
    }

    private var legalSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Legal")
                .font(.title3.weight(.semibold))
                .foregroundStyle(DrinkColors.textPrimary)

            row(title: "Política de Privacidade", value: "Em breve")
            row(title: "Termos de Uso", value: "Em breve")
            row(title: "Contato", value: "mvtitton@gmail.com")
        }
    }

    private var footer: some View {
        Text("Este app está em desenvolvimento e algumas funcionalidades podem mudar antes da publicação.")
            .font(.caption)
            .foregroundStyle(DrinkColors.textSecondary)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .padding(.top, 12)
    }

    private func row(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .foregroundStyle(DrinkColors.textPrimary)

            Spacer()

            Text(value)
                .foregroundStyle(DrinkColors.textSecondary)
        }
        .padding(16)
        .background(DrinkColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}
