//
//  CityModel.swift
//  CityApp
//
//  Created by Constanza Lancieri on 18/05/2025.
//

struct CityModel: Codable {
    let country: String
    let name: String
    let id: Int
    let coord: Coordinate
    
    enum CodingKeys: String, CodingKey {
        case country
        case name
        case id = "_id"
        case coord
    }
}

struct Coordinate: Codable {
    let lon: Double
    let lat: Double
}
