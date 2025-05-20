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
    var onSelected: (CitiesListModel) -> Void
    @State var isLoading: Bool = true
    
    var body: some View {
        ScrollView {
            switch viewModel.state {
            case .loading:
                citiesCellView
                    .skeletonView(reason: isLoading)
            case .success:
                citiesCellView
            case .empty:
                EmptyListView()
            case .error:
                ErrorView()
            }
        }
        .searchable(text: $viewModel.searchText)
        .scrollIndicators(.hidden)
        .listStyle(.plain)
        .onAppear {
            isLoading = true
            Task {
                await viewModel.getCities()
                viewModel.filterCities()
                isLoading = false
            }

        }
    }
    
    @ViewBuilder var citiesCellView: some View {
        LazyVStack {
            ForEach(viewModel.filteredCities) { city in
                CitiesCellView(city: city, favorites: favorites)
                    .onTapGesture {
                        onSelected(city)
                    }
            }
            .listRowBackground(Color.clear)
            .frame(height: 44)
            .padding()
        }
    }
}
