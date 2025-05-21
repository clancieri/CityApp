//
//  Favourites.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import Foundation

final class FavoritesRepository: ObservableObject {
    @Published private var cities: Set<Int>
    private let FAVOURITE = "fav_key"
    
    init() {
        let saved = (UserDefaults.standard.array(forKey: FAVOURITE) as? [Int]) ?? []
        cities = Set(saved)
    }
    
    func contains(_ city: CitiesListModel) -> Bool {
        cities.contains(city.city.id)
    }
    
    func add(_ city: CitiesListModel) {
        cities.insert(city.city.id)
        save(cities)
    }
    
    func remove(_ city: CitiesListModel) {
        cities.remove(city.city.id)
        save(cities)
    }
    
    func save(_ cities: Set<Int>) {
        let citiesArray = Array(cities)
        UserDefaults.standard.set(citiesArray, forKey: FAVOURITE)
    }
    
    func getSaved() -> [Int] {
        let saved = UserDefaults.standard.array(forKey: FAVOURITE) as? [Int] ?? []
        return saved
    }
}
