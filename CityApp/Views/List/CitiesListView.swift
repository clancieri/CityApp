//
//  CitiesListView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import SwiftUI

struct CitiesListView: View {
    @ObservedObject var viewModel: CitiesListViewModel
    var onSelected: (CitiesListModel) -> Void
    @State var isLoading: Bool = true
    @State var showFavorites: Bool = false
    
    var body: some View {
        ScrollView {
            switch viewModel.state {
            case .loading:
                citiesListView
                    .skeletonView(reason: isLoading)
            case .success:
                citiesListView
            case .empty:
                EmptyListView()
            case .error:
                ErrorView()
            }
        }
        .showSearchBar(!showFavorites, text: $viewModel.searchText)
        .scrollIndicators(.hidden)
        .onAppear {
            isLoading = true
            Task {
                await viewModel.getCities()
                viewModel.filterCities()
                isLoading = false
            }

        }
    }
    
    @ViewBuilder var citiesListView: some View {
        LazyVStack {
            Button {
                showFavorites.toggle()
                viewModel.updateFilteredCities(by: showFavorites)
            } label: {
                Text(!showFavorites ? "Ver los favoritos" : "Mostrar toda la lista")
                    .font(Fonts.regular(size: 18))
                    .padding(.top)
            }
            
            ForEach(viewModel.filteredCities) { city in
                CitiesCellView(
                    city: city,
                    isFavorite: viewModel.isFavorite(city: city),
                    onTapFavorite: { viewModel.handleFavorites(with: city) }
                )
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
