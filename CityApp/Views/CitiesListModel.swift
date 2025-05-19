//
//  CitiesListModel.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import Foundation

class CitiesListModel: ObservableObject, Identifiable {
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
}
