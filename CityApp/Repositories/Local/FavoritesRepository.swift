//
//  Favourites.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import Foundation

protocol FavoritesRepositoryProtocol {
    func contains(_ cityId: Int) -> Bool
    func add(_ cityId: Int)
    func remove(_ cityId: Int)
    func save(_ cities: Set<Int>)
    func getSaved() -> [Int]
    func toggleFavorites(with cityId: Int)
}

final class FavoritesRepository: FavoritesRepositoryProtocol, ObservableObject {
    private let FAVOURITE = "fav_key"
    @Published private var cities: Set<Int>
    private let userDefaults: UserDefaults = .standard
    
    init() {
        let saved = (userDefaults.array(forKey: FAVOURITE) as? [Int]) ?? []
        cities = Set(saved)
    }
    
    func contains(_ cityId: Int) -> Bool {
        cities.contains(cityId)
    }
    
    func add(_ cityId: Int) {
        cities.insert(cityId)
        save(cities)
    }
    
    func remove(_ cityId: Int) {
        cities.remove(cityId)
        save(cities)
    }
    
    func save(_ cities: Set<Int>) {
        let citiesArray = Array(cities)
        userDefaults.set(citiesArray, forKey: FAVOURITE)
    }
    
    func getSaved() -> [Int] {
        let saved = userDefaults.array(forKey: FAVOURITE) as? [Int] ?? []
        return saved
    }
    
    func toggleFavorites(with cityId: Int) {
        cities.contains(cityId) ? remove(cityId) : add(cityId)
    }
}
