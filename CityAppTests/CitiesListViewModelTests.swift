//
//  CitiesListViewModelTests.swift
//  CityAppTests
//
//  Created by Constanza Lancieri on 21/05/2025.
//

import XCTest
@testable import CityApp

final class CitiesListViewModelTests: XCTestCase {
    private var sut: CitiesListViewModel!
    private var fakeService: FakeCitiesService!
    private var fakeFavorites: FakeFavoritesRepository!
    
    override func setUp() {
        super.setUp()
        fakeService = FakeCitiesService()
        fakeFavorites = FakeFavoritesRepository()
        sut = CitiesListViewModel(favorites: fakeFavorites, service: fakeService)
        
    }
    override func tearDown() {
        sut = nil
        fakeService = nil
        fakeService = nil
        super.tearDown()
    }
    
    func test_getCities_whenIsSuccess_shouldUpdateStateAndCities() async {
        let expectedCities: [CityModel] = [CityModel.fake(id: 1)]
        fakeService.citiesResult = expectedCities
        
        await sut.initCities()
        
        XCTAssertEqual(sut.state, .success)
        XCTAssertEqual(sut.cities.count, expectedCities.count)
    }
    
    func test_getCities_whenIsError_shouldUpdateStateToError() async {
        fakeService.error = ServiceError.invalidData
        
        await sut.initCities()
        
        XCTAssertEqual(sut.state, .error)
        XCTAssertEqual(sut.cities.count, 0)
    }
    
    func test_handleSearch_whenEmptyText_shouldShowAllCities() {
        let cities = [
            CitiesListModel(city: .fake()),
            CitiesListModel(city: .fake(id: 2)),
            CitiesListModel(city: .fake(id: 3))
        ]
        sut.cities = cities
        
        sut.handleSearch("")
        
        XCTAssertEqual(sut.filteredCities, cities)
        XCTAssertEqual(sut.filteredCities.count, 3)
        XCTAssertEqual(sut.state, .success)
    }
    
    func test_handleSearch_whenErrorState_shouldNotSearch() async {
        fakeService.error = ServiceError.invalidResponse
        await sut.initCities()
        
        sut.handleSearch("buenos")
        
        XCTAssertEqual(sut.state, .error)
        XCTAssertEqual(sut.cities.count, 0)
    }
    
    func test_handleSearch_whenIsEmptyState_shouldReturnEmpty() async {
        let cities = [
            CityModel.fake(name: "Barcelona"),
            CityModel.fake(name: "Catamarca"),
            CityModel.fake(name: "Cusco")
        ]
        fakeService.citiesResult = cities
        
        await sut.initCities()
        
        sut.handleSearch("Corrientes")
        
        XCTAssertEqual(sut.state, .empty)
        XCTAssertEqual(sut.filteredCities.count, 0)
    }
    
    func test_handleSearch_whenPrefixSomeCities_shouldReturnCitiesMatch() async {
        let cities = [
            CityModel.fake(name: "Carmelo"),
            CityModel.fake(name: "Buenos Aires"),
            CityModel.fake(name: "Catamarca"),
            CityModel.fake(name: "Corrientes"),
            CityModel.fake(name: "California")
        ]
        fakeService.citiesResult = cities
        
        await sut.initCities()
        
        sut.handleSearch("Ca")
        let name = sut.filteredCities.map { $0.city.name }
        
        XCTAssertEqual(sut.state, .success)
        XCTAssertEqual(sut.filteredCities.count, 3)
        XCTAssertTrue(name.contains("Carmelo"))
        XCTAssertTrue(name.contains("California"))
        XCTAssertTrue(name.contains("Catamarca"))
        XCTAssertFalse(name.contains("Buenos Aires"))
    }
    
    func test_handleSearch_whenPrefixIsLowercase_shouldIgnoreCaseAndReturnMatches() async {
        let cities = [
            CityModel.fake(name: "Tokio"),
            CityModel.fake(name: "Barcelona"),
            CityModel.fake(name: "Madrid"),
            CityModel.fake(name: "Corrientes"),
            CityModel.fake(name: "Segovia")
        ]
        fakeService.citiesResult = cities
        
        await sut.initCities()
        
        sut.handleSearch("tokio")
        let name = sut.filteredCities.map { $0.city.name }
        
        XCTAssertEqual(sut.state, .success)
        XCTAssertEqual(sut.filteredCities.count, 1)
        XCTAssertTrue(name.contains("Tokio"))
        
    }
    
    func test_handleSearch_whenPrefixIsUppercase_shouldIgnoreCaseAndReturnMatches() async {
        let cities = [
            CityModel.fake(name: "Tokio"),
            CityModel.fake(name: "Barcelona"),
            CityModel.fake(name: "Madrid"),
            CityModel.fake(name: "Corrientes"),
            CityModel.fake(name: "Segovia")
        ]
        fakeService.citiesResult = cities
        
        await sut.initCities()
        
        sut.handleSearch("MADR")
        let name = sut.filteredCities.map { $0.city.name }
        
        XCTAssertEqual(sut.state, .success)
        XCTAssertEqual(sut.filteredCities.count, 1)
        XCTAssertTrue(name.contains("Madrid"))
        
    }
    
}

final class FakeCitiesService: CitiesServiceProtocol {
    var citiesResult: [CityModel] = []
    var error: Error?
    func getCities() async -> Result<[CityModel], Error> {
        if let error = error {
            return .failure(error)
        } else {
            return .success(citiesResult)
        }
    }
}
