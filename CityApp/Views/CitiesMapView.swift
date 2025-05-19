//
//  CitiesMapView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import SwiftUI
import MapKit

struct CitiesMapView: View {
    let name: String
    let latitude: Double
    let longitude: Double
    
    var body: some View {
        VStack {
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let cameraPosition: MapCameraPosition = .region(.init(center: coordinate, latitudinalMeters: 1300, longitudinalMeters: 1300))
            
            Map(initialPosition: cameraPosition) {
                Marker(name, coordinate: coordinate)
            }
        }
    }
}

#Preview {
    CitiesMapView(name: "Buenos Aires", latitude: -34.603851, longitude: -58.381775)
}
