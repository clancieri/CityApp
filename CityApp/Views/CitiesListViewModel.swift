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
    @Published var filteredCities: [CitiesListModel] = []
    @Published var state: StateView = .loading
    private var cancellables = Set<AnyCancellable>()
    
    @MainActor
    func getCities() async {
        let result = await service.getCities()
        
        switch result {
        case .success(let resultCities):
            self.state = !cities.isEmpty ? .success : .empty
            self.cities = resultCities.map { CitiesListModel(id: $0.id, city: $0) }
            self.cities.forEach { trie.insert($0.city) }
        case .failure(let failure):
            self.state = .error
            print(failure)
        }
    }
    
    func filterCities() {
        $searchText
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                guard let self = self else { return }
                if text.isEmpty {
                    self.filteredCities = self.cities
                } else {
                    let citiesMatches = self.trie.search(prefix: text)
                    self.filteredCities = citiesMatches.map { CitiesListModel(id: $0.id, city: $0) }
                }
            }
            .store(in: &cancellables)
    }
}
