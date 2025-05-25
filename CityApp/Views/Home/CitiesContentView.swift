//
//  CitiesContentView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 18/05/2025.
//

import SwiftUI

struct CitiesContentView: View {
    let viewModel: CitiesContentViewModel
    @State var navigationPath = NavigationPath()
    @State private var selectedCity: CitiesListModel?
    @StateObject var listViewModel = CitiesListViewModel()
    
    var body: some View {
        NavigationSplitView {
            NavigationStack(path: $navigationPath) {
                CitiesListView(viewModel: listViewModel, onSelected: { city in
                    selectedCity = city
                    if viewModel.shouldNavigateWithStack() {
                        navigationPath.append(city)
                    }
                })
                .navigationDestination(for: CitiesListModel.self) { city in
                    let viewModel = CitiesMapViewModel(city: city)
                    CitiesMapView(viewModel: viewModel)
                }
            }
        } detail: {
            if let selectedCity, viewModel.shouldNavigateWithSplit() {
                let viewModel = CitiesMapViewModel(city: selectedCity)
                CitiesMapView(viewModel: viewModel)
            } else {
                Text("map.select.city")
            }
        }
    }
}
