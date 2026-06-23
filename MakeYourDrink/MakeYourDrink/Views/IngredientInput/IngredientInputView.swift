//
//  IngredientInputView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct IngredientInputView: View {

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {

                    header

                    inputCard(
                        icon: "camera.viewfinder",
                        title: "Tirar Foto",
                        subtitle: "Escaneie sua bancada, geladeira ou bar."
                    )

                    NavigationLink {
                        TextIngredientInputView()
                    } label: {
                        inputCard(
                            icon: "text.cursor",
                            title: "Escrever Ingredientes",
                            subtitle: "Digite os ingredientes que você possui."
                        )
                    }
                    .buttonStyle(.plain)

                    NavigationLink {
                        MyBarView()
                    } label: {
                        inputCard(
                            icon: "checklist",
                            title: "Selecionar da Lista",
                            subtitle: "Escolha ingredientes manualmente."
                        )
                    }
                    .buttonStyle(.plain)
                }
                .padding(20)
            }
        }
        .navigationTitle("Ingredientes")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {

            Text("Como deseja informar seus ingredientes?")
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Escolha uma das opções abaixo.")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func inputCard(
        icon: String,
        title: String,
        subtitle: String
    ) -> some View {

        HStack(spacing: 16) {

            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundStyle(DrinkColors.accent)
                .frame(width: 50)

            VStack(alignment: .leading, spacing: 6) {

                Text(title)
                    .font(.headline)
                    .foregroundStyle(DrinkColors.textPrimary)

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(DrinkColors.textSecondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(DrinkColors.textSecondary)
        }
        .padding(20)
        .background(DrinkColors.card)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 24,
                style: .continuous
            )
        )
    }
}
