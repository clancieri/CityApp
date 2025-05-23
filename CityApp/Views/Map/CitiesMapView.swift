//
//  CitiesMapView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import SwiftUI
import MapKit

struct CitiesMapView: View {
    let viewModel: CitiesMapViewModel
    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var mapItem: MKMapItem?
    @State private var selectedMapItem: MKMapItem?
        
    var body: some View {
        VStack {
            Map(position: $cameraPosition, selection: $selectedMapItem) {
                if let mapItem {
                    Marker(item: mapItem)
                        .tag(mapItem)
                        .mapItemDetailSelectionAccessory(.sheet)
                }
            }
        }
        .onChange(of: viewModel.city) { _, newCity in
            withAnimation {
                mapItem = viewModel.createMapItem()
                cameraPosition = viewModel.createCameraPosition()
            }
        }
        .onAppear {
            mapItem = viewModel.createMapItem()
            withAnimation {
                cameraPosition = viewModel.createCameraPosition()
            }
        }
    }
}
