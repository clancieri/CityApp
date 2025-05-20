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
    @State private var cameraPosition: MapCameraPosition = .automatic
    private let defaultZoom: Double = 1300
    
    var body: some View {
        VStack {
            Map(position: $cameraPosition) {
                Marker(city.city.name, coordinate: cityCoordinate)
            }
            .onChange(of: city) { _, newCity in
                withAnimation {
                    cameraPosition = createCameraPosition()
                }
            }
        }
        .onAppear {
            withAnimation {
                cameraPosition = createCameraPosition()
            }
        }
    }
    
    var cityCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: city.city.coord.lat,
            longitude: city.city.coord.lon
        )
    }
    
    private func createCameraPosition() -> MapCameraPosition {
        return .region(
            MKCoordinateRegion(
                center: cityCoordinate,
                latitudinalMeters: defaultZoom,
                longitudinalMeters: defaultZoom
            )
        )
    }
}
