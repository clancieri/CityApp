//
//  CitiesListViewModelTests.swift
//  CityAppTests
//
//  Created by Constanza Lancieri on 21/05/2025.
//

import XCTest
@testable import CityApp

final class CitiesListViewModelTests: XCTestCase {
    private var sut: CitiesContentViewModel!
    private var fakeService: CitiesServiceProtocol!
    private var fakeFavorites: FavoritesRepositoryProtocol!
    
    override class func setUp() {
        super.setUp()
        
        
    }
    
}

// MARK: - Mocks
final class FakeCitiesService: CitiesServiceProtocol {
    var getCitiesResult: Result<[CityModel], Error> = .success([])
    
    func getCities() async -> Result<[CityModel], Error> {
        getCitiesResult
    }
}

final class FakeFavoritesRepository: FavoritesRepositoryProtocol {
    var containsCalled = false
    var toggleFavoritesCalled = false
    var containsResult = false
    var savedIds: Set<Int> = []
    
    func add(_ cityId: Int) {
        
    }
    
    func remove(_ cityId: Int) {
        
    }
    
    func save(_ cities: Set<Int>) {
        
    }
    
    func getSaved() -> [Int] {
        return Array(savedIds)
    }
    
    func contains(_ id: Int) -> Bool {
        containsCalled = true
        return containsResult
    }
    
    func toggleFavorites(with id: Int) {
        toggleFavoritesCalled = true
    }
    
    func getSaved() -> Set<Int> {
        savedIds
    }
}
