//
//  CitiesListView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import SwiftUI

struct CitiesListView: View {
    let cities: [CitiesListModel]
    @StateObject var favorites: Favorites = Favorites()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(cities) { city in
                    CitiesCellView(city: city, favorites: favorites)
                }
                .listRowBackground(Color.clear)
                .frame(height: 44)
                .padding()
            }
        }
        .scrollIndicators(.hidden)
        .listStyle(.plain)
    }
}
