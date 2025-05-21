//
//  CitiesListModel.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import Foundation

class CitiesListModel: Identifiable, Equatable, Hashable {
    let city: CityModel
    
    init(city: CityModel) {
        self.city = city
    }
    
    var title: String {
        let name = city.name
        let code = city.country
        return name + ", " + code
    }
    
    var subtitle: String {
        let latitude = String(city.coord.lat)
        let longitude = String(city.coord.lon)
        
        let subtitle = latitude + ", " + longitude
        return subtitle
    }
    
    static var placeholder: [CitiesListModel] = [
        CitiesListModel(city: .init(country: "ARS", name: "Argentina", id: 242342342, coord: Coordinate(lon: 12.132131, lat: -132113123))),
        CitiesListModel(city: .init(country: "ARS", name: "Argentina", id: 242342342, coord: Coordinate(lon: 12.132131, lat: -132113123))),
        CitiesListModel(city: .init(country: "ARS", name: "Argentina", id: 242342342, coord: Coordinate(lon: 12.132131, lat: -132113123))),
        CitiesListModel(city: .init(country: "ARS", name: "Argentina", id: 242342342, coord: Coordinate(lon: 12.132131, lat: -132113123))),
        CitiesListModel(city: .init(country: "ARS", name: "Argentina", id: 242342342, coord: Coordinate(lon: 12.132131, lat: -132113123))),
        CitiesListModel(city: .init(country: "ARS", name: "Argentina", id: 242342342, coord: Coordinate(lon: 12.132131, lat: -132113123))),
        CitiesListModel(city: .init(country: "ARS", name: "Argentina", id: 242342342, coord: Coordinate(lon: 12.132131, lat: -132113123))),
        CitiesListModel(city: .init(country: "ARS", name: "Argentina", id: 242342342, coord: Coordinate(lon: 12.132131, lat: -132113123))),
    ]
    
    static func == (lhs: CitiesListModel, rhs: CitiesListModel) -> Bool {
        return lhs.city == rhs.city && lhs.title == rhs.title && lhs.id == rhs.id && lhs.subtitle == rhs.subtitle
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(city)
        hasher.combine(title)
        hasher.combine(subtitle)
        hasher.combine(id)
    }
}

