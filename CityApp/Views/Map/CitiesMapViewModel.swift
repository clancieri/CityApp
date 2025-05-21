//
//  CitiesMapViewModel.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import Foundation
import SwiftUI
import MapKit

class CitiesMapViewModel: ObservableObject {
    let city: CitiesListModel
    
    init(city: CitiesListModel) {
        self.city = city
    }
    
    var latitude: Double {
        city.latitude
    }
    
    var longitude: Double {
        city.longitude
    }
    
    func createCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
    
    func createCameraPosition(defaultZoom: Double = 1300) -> MapCameraPosition {
        return .region(
            MKCoordinateRegion(
                center: createCoordinate(),
                latitudinalMeters: defaultZoom,
                longitudinalMeters: defaultZoom
            )
        )
    }
    
    func createMapItem() -> MKMapItem {
        let placemark = MKPlacemark(coordinate: createCoordinate())
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = city.name
        
        return mapItem
    }
}
