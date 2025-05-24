//
//  CitiesListViewModel.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import Foundation
import Combine

final class CitiesListViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var state: StateView = .loading
    @Published var cities: [CitiesListModel] = []
    @Published var favorites: FavoritesRepositoryProtocol
    @Published var filteredCities: [CitiesListModel] = CitiesListModel.placeholder
    
    private let trie = CityTrie()
    private let service: CitiesServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(favorites: FavoritesRepositoryProtocol = FavoritesRepository(), service: CitiesServiceProtocol = CitiesService()) {
        self.favorites = favorites
        self.service = service
    }
    
    @MainActor
    func getCities() async {
        let result = await service.getCities()
        
        switch result {
        case .success(let resultCities):
            self.cities = resultCities.map { CitiesListModel(city: $0) }
            self.cities.forEach { trie.insert($0.city) }
            self.filteredCities = self.cities
            state = .success
        case .failure(_):
            state = .error
        }
    }
    
    func filterCities() {
        $searchText
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                guard let self = self else { return }
                self.handleSearch(text)
            }
            .store(in: &cancellables)
    }
    
    func handleSearch(_ text: String) {
        guard state != .error else { return }
        if text.isEmpty {
            filteredCities = cities
            /// Handle the case that we were showing the empty state
            state = .success
        } else {
            let citiesMatches = trie.search(prefix: text)
            filteredCities = citiesMatches.map { CitiesListModel(city: $0) }
            state = filteredCities.isEmpty ? .empty : .success
        }
    }
    
    func isFavorite(id: Int) -> Bool {
        favorites.contains(id)
    }
    
    func handleFavorites(with id: Int) {
        favorites.toggleFavorites(with: id)
    }
    
    func updateFilteredCities(by showFavorites: Bool) {
        let favoritesSaved = favorites.getSaved()
        let onlyFavorites = cities.filter { favoritesSaved.contains($0.city.id) }
        /// After showing the favorites, we need to reset the search text so every city is shown
        searchText = !showFavorites ? "" : searchText
        filteredCities = showFavorites ? onlyFavorites : cities
    }
}
