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
    
    var name: String {
        city.name
    }
    
    var latitude: Double {
        city.coord.lat
    }
    
    var longitude: Double {
        city.coord.lon
    }
    
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
