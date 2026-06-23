//
//  MainTabView.swift
//  MakeYourDrink
//
//  Created by Marcus Titton on 23/06/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Início")
                }

            MyBarView()
                .tabItem {
                    Image(systemName: "shippingbox.fill")
                    Text("Meu Bar")
                }

            DiscoverView()
                .tabItem {
                    Image(systemName: "sparkles")
                    Text("Descobrir")
                }

            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favoritos")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Perfil")
                }
        }
        .tint(DrinkColors.accent)
    }
}
