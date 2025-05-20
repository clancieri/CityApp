//
//  CitiesListViewModel.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import Foundation
import Combine

class CitiesListViewModel: ObservableObject {
    @Published var searchText = ""
    private let trie = CityTrie()
    
    let service: CitiesServiceProtocol = CitiesService()
    @Published var cities: [CitiesListModel] = []
    @Published var filteredCities: [CitiesListModel] = CitiesListModel.placeholder
    @Published var state: StateView = .loading
    private var cancellables = Set<AnyCancellable>()
    
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
        guard state != .error else { return }
        $searchText
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                guard let self = self else { return }
                if text.isEmpty {
                    self.filteredCities = self.cities
                    state = .success
                } else {
                    let citiesMatches = self.trie.search(prefix: text)
                    self.filteredCities = citiesMatches.map { CitiesListModel(city: $0) }
                    state = filteredCities.isEmpty ? .empty : .success
                }
               
            }
            .store(in: &cancellables)
    }
}
