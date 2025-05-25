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
    @State var showFavorites: Bool = false
    
    var body: some View {
        ScrollView {
            switch viewModel.state {
            case .loading:
                citiesListView
                    .redacted(reason: .placeholder)
            case .success:
                citiesListView
            case .empty:
                EmptyListView()
            case .error:
                ErrorView()
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.background)
        .showSearchBar(!showFavorites, text: $viewModel.searchText)
        .scrollIndicators(.hidden)
        .onAppear {
            Task {
                await viewModel.initCities()
                viewModel.filterCities()
            }
        }
    }
    
    @ViewBuilder var citiesListView: some View {
        headerListView
        
        LazyVStack {
            ForEach(viewModel.filteredCities) { city in
                let id = city.city.id
                CitiesCellView(
                    city: city,
                    isFavorite: viewModel.isFavorite(id: id),
                    onTapFavorite: { viewModel.handleFavorites(with: id) }
                )
                .padding(.vertical, 5)
                .onTapGesture {
                    onSelected(city)
                }
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder var headerListView: some View {
        HStack {
            Text("home.list.title")
                .font(Fonts.bold(size: 20))
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            FavoriteButton(showFavorites: showFavorites) {
                showFavorites.toggle()
                viewModel.updateFilteredCities(by: showFavorites)
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 25)
    }
}
