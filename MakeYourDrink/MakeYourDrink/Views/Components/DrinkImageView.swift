//
//  DrinkImageView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 24/06/26.
//

import SwiftUI

struct DrinkImageView: View {
    let imageName: String
    let drinkName: String

    var body: some View {
        if UIImage(named: imageName) != nil {
            Image(imageName)
                .resizable()
                .scaledToFill()
        } else {
            DrinkImagePlaceholderView(drinkName: drinkName)
        }
    }
}
