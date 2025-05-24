//
//  CityTrieTests.swift
//  CityAppTests
//
//  Created by Constanza Lancieri on 24/05/2025.
//

import XCTest
@testable import CityApp

final class CityTrieTests: XCTestCase {
    private var sut: CityTrie!
    
    override func setUp() {
        super.setUp()
        sut = CityTrie()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_insertACity_shouldFindCity() {
        let city = CityModel.fake(name: "Cordoba")
        
        sut.insert(city)
        let result = sut.search(prefix: "Cor")
        
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.name, "Cordoba")
    }
    
    func test_search_withEmptyPrefix_shouldReturnAllCities() {
        let cities = [
            CityModel.fake(name: "Paris"),
            CityModel.fake(name: "Montevideo"),
            CityModel.fake(name: "Nueva York")
        ]
        cities.forEach { sut.insert($0) }
        
        let result = sut.search(prefix: "")
        
        XCTAssertEqual(result.count, 3)
    }
    
    func test_search_withNonExistingPrefixCity_shouldReturnEmpty() {
        let city = CityModel.fake(name: "Buenos Aires")
        sut.insert(city)
        
        let result = sut.search(prefix: "Xyz")
        
        XCTAssertTrue(result.isEmpty)
    }
    
    func test_search_withNumberString_shouldReturnEmpty() {
        let city = CityModel.fake(name: "Buenos Aires")
        sut.insert(city)
        
        let result = sut.search(prefix: "2234")
        
        XCTAssertTrue(result.isEmpty)
    }
    
    func test_search_withLowerCase_shouldBeCaseInsensitive() {
        let city = CityModel.fake(name: "Mendoza")
        sut.insert(city)
        
        let lowercase = sut.search(prefix: "men")
        
        XCTAssertEqual(lowercase.count, 1)
    }
    
    func test_search_withUpperCase_shouldBeCaseInsensitive() {
        let city = CityModel.fake(name: "Londres")
        sut.insert(city)
        
        let uppercase = sut.search(prefix: "LON")
        
        XCTAssertEqual(uppercase.count, 1)
    }
    
    func test_search_withMultipleCitiesWithSamePrefix_shouldReturnAll() {
        let cities = [
            CityModel.fake(name: "Paris"),
            CityModel.fake(name: "Parma")
        ]
        cities.forEach { sut.insert($0) }
        
        let result = sut.search(prefix: "Par")
        
        XCTAssertEqual(result.count, 2)
        XCTAssertTrue(result.contains { $0.name == "Paris" })
        XCTAssertTrue(result.contains { $0.name == "Parma" })
    }
}
