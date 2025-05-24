//
//  FavoritesRepositoryTests.swift
//  CityApp
//
//  Created by Constanza Lancieri on 24/05/2025.
//

import XCTest
@testable import CityApp

final class FavoritesRepositoryTests: XCTestCase {
    private var sut: FakeFavoritesRepository!
    
    override func setUp() {
        super.setUp()
        sut = FakeFavoritesRepository()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_addCity_shouldSaveCity() {
        let cityId = 5
        
        sut.add(cityId)
        
        XCTAssertTrue(sut.contains(cityId))
        XCTAssertEqual(sut.getSaved(), [5])
    }
    
    func test_removeCity_shouldRemoved() {
        let cityId = 3
        sut.add(cityId)
        
        sut.remove(cityId)
        
        XCTAssertFalse(sut.contains(3))
        XCTAssertEqual(sut.getSaved(), [])
    }
    
    func test_toggleFavorites_shouldAddWhenNotExistsCity() {
        let cityId = 1
        
        sut.toggleFavorites(with: cityId)
        
        XCTAssertTrue(sut.contains(cityId))
    }
    
    func test_toggleFavorites_shouldRemoveWhenExistsCity() {
        let cityId = 1
        sut.add(cityId)
        
        sut.toggleFavorites(with: cityId)
        
        XCTAssertFalse(sut.contains(cityId))
    }
    
    func test_getSaved_shouldReturnAllSavedCities() {
        let cityIds = [1, 2, 3]
        cityIds.forEach { sut.add($0) }
        
        let saved = sut.getSaved()
        
        XCTAssertEqual(Set(saved), Set(cityIds))
    }
}

final class FakeFavoritesRepository: FavoritesRepositoryProtocol {
    private var cities: Set<Int> = []
    
    func add(_ cityId: Int) {
        cities.insert(cityId)
    }
    
    func remove(_ cityId: Int) {
        cities.remove(cityId)
    }
    
    func contains(_ cityId: Int) -> Bool {
        cities.contains(cityId)
    }
    
    func getSaved() -> [Int] {
        Array(cities)
    }
    func save(_ cities: Set<Int>) {}
    
    func toggleFavorites(with cityId: Int) {
        if cities.contains(cityId) {
            remove(cityId)
        } else {
            add(cityId)
        }
    }
}
