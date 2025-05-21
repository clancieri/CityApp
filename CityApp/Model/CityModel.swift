//
//  CityModel.swift
//  CityApp
//
//  Created by Constanza Lancieri on 18/05/2025.
//

struct CityModel: Codable, Equatable, Hashable {
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
    
    static func == (lhs: CityModel, rhs: CityModel) -> Bool {
        return lhs.country == rhs.country && lhs.name == rhs.name && lhs.id == rhs.id && lhs.coord == rhs.coord
    }
    
}

struct Coordinate: Codable, Equatable, Hashable {
    let lon: Double
    let lat: Double
}
