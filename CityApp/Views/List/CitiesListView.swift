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
        .background(Color.background)
        .showSearchBar(!showFavorites, text: $viewModel.searchText)
        .scrollIndicators(.hidden)
        .onAppear {
            Task {
                await viewModel.getCities()
                viewModel.filterCities()
            }
        }
    }
    
    @ViewBuilder var citiesListView: some View {
        LazyVStack {
            HStack {
                Text("Lista de ciudades")
                    .font(Fonts.semibold(size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    showFavorites.toggle()
                    viewModel.updateFilteredCities(by: showFavorites)
                } label: {
                    Text(!showFavorites ? "Favoritas" : "Ver todas")
                        .font(Fonts.medium(size: 13))
                        .foregroundStyle(Color.yellowText)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(
                            RoundedRectangle(
                                cornerRadius: 20,
                                style: .continuous
                            )
                            .fill(Color.yellowButton)
                        )
                }
            }
            .padding(.horizontal, 5)
            
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
        .padding()
    }
}
