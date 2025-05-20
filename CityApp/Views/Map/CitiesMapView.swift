//
//  CitiesMapView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import SwiftUI
import MapKit

struct CitiesMapView: View {
    let city: CitiesListModel
    @State private var cameraPosition: MapCameraPosition = .region(.init(center: CLLocationCoordinate2D(latitude: -34.603851, longitude: -58.381775), latitudinalMeters: 1300, longitudinalMeters: 1300))
    
    
    var body: some View {
        VStack {
            let coordinate = CLLocationCoordinate2D(latitude: city.city.coord.lat, longitude: city.city.coord.lon)
            
            Map(position: $cameraPosition) {
                Marker(city.city.name, coordinate: coordinate)
            }
            .onChange(of: city) { _, newCity in
                withAnimation {
                    cameraPosition = .region(.init(center: CLLocationCoordinate2D(latitude: newCity.city.coord.lat, longitude: newCity.city.coord.lon), latitudinalMeters: 1300, longitudinalMeters: 1300))
                }
            }
        }
        .onAppear {
            withAnimation {
                cameraPosition = .region(.init(center: CLLocationCoordinate2D(latitude: city.city.coord.lat, longitude: city.city.coord.lon), latitudinalMeters: 1300, longitudinalMeters: 1300))
            }
        }
    }
}
