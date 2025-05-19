//
//  CitiesContentViewModel.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import Foundation

enum StateView {
    case loading
    case success
    case empty
    case error
}

class CitiesContentViewModel: ObservableObject {
    let service: CitiesServiceProtocol = CitiesService()
    @Published var cities: [CitiesListModel] = []
    @Published var state: StateView = .loading

    @MainActor
    func getCities() async {
        let result = await service.getCities()
        
        switch result {
        case .success(let cities):
            self.state = !cities.isEmpty ? .success : .empty
            self.cities = cities.map { CitiesListModel(id: $0.id, city: $0) }
        case .failure(let failure):
            self.state = .error
            print(failure)
        }
    }
}
