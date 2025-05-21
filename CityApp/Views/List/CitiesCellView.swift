//
//  CitiesCellView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//
import SwiftUI

struct CitiesCellView: View {
    let city: CitiesListModel
    @StateObject var favorites: FavoritesRepository
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(city.title)
                Text(city.subtitle)
            }
            
            Spacer()
            
            Image(systemName: favorites.contains(city) ? "star.fill" : "star")
                .foregroundStyle(.yellow)
                .onTapGesture {
                    if favorites.contains(city) {
                        favorites.remove(city)
                    } else {
                        favorites.add(city)
                    }
                }
        }
    }
}
