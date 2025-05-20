//
//  CitiesContentView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 18/05/2025.
//

import SwiftUI

struct CitiesContentView: View {
    @ObservedObject var viewModel: CitiesContentViewModel
    @StateObject var listViewModel = CitiesListViewModel()
    @State private var selectedCity: CitiesListModel?
    
    var body: some View {
        NavigationSplitView {
            CitiesListView(viewModel: listViewModel, onSelected: { city in
                selectedCity = city
            })
        } detail: {
            if let selectedCity {
                CitiesMapView(city: selectedCity)
            }
        }
    }
}
