//
//  CitiesContentView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 18/05/2025.
//

import SwiftUI

struct CitiesContentView: View {
    @ObservedObject var viewModel: CitiesContentViewModel
    @State private var selectedCity: CitiesListModel?
    @State private var isDetailPresented = false
    
    var body: some View {
        NavigationStack {
            CitiesListView(viewModel: CitiesListViewModel(), onSelected: { city in
                selectedCity = city
                isDetailPresented = true
            })
            .navigationDestination(isPresented: $isDetailPresented) {
                if let selectedCity {
                    CitiesMapView(name: selectedCity.city.name, latitude: selectedCity.city.coord.lat, longitude: selectedCity.city.coord.lon)
                }
            }
        }
    }
}
