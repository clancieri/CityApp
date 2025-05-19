//
//  CitiesListView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import SwiftUI

struct CitiesListView: View {
    @ObservedObject var viewModel: CitiesListViewModel
    @StateObject var favorites: Favorites = Favorites()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.filteredCities) { city in
                    CitiesCellView(city: city, favorites: favorites)
                }
                .listRowBackground(Color.clear)
                .frame(height: 44)
                .padding()
            }
        }
        .searchable(text: $viewModel.searchText)
        .scrollIndicators(.hidden)
        .listStyle(.plain)
        .onAppear {
            Task {
                await viewModel.getCities()
                viewModel.filterCities()
            }
        }
    }
}
