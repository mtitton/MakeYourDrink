//
//  ShoppingIngredientDetailView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct ShoppingIngredientDetailView: View {
    let suggestion: ShoppingSuggestion

    var body: some View {
        ZStack {
            DrinkColors.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    header

                    VStack(spacing: 14) {
                        ForEach(suggestion.affectedMatches) { match in
                            DrinkCard(match: match)
                        }
                    }
                }
                .padding(20)
            }
        }
        .navigationTitle(suggestion.ingredientName)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(suggestion.ingredientName)
                .font(.largeTitle.bold())
                .foregroundStyle(DrinkColors.textPrimary)

            Text("Este ingrediente ajuda a desbloquear \(suggestion.unlockCount) drink\(suggestion.unlockCount == 1 ? "" : "s").")
                .font(.subheadline)
                .foregroundStyle(DrinkColors.textSecondary)
        }
    }
}
