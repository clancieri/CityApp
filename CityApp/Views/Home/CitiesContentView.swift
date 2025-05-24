//
//  CitiesContentView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 18/05/2025.
//

import SwiftUI

struct CitiesContentView: View {
    @State var navigationPath = NavigationPath()
    @State private var selectedCity: CitiesListModel?
    @StateObject var listViewModel = CitiesListViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        NavigationSplitView {
            NavigationStack(path: $navigationPath) {
                CitiesListView(viewModel: listViewModel, onSelected: { city in
                    selectedCity = city
                    if verticalSizeClass == .regular {
                        navigationPath.append(city)
                    }
                })
                .navigationDestination(for: CitiesListModel.self) { city in
                    let viewModel = CitiesMapViewModel(city: city)
                    CitiesMapView(viewModel: viewModel)
                }
            }
        } detail: {
            if let selectedCity, verticalSizeClass == .compact {
                let viewModel = CitiesMapViewModel(city: selectedCity)
                CitiesMapView(viewModel: viewModel)
            } else {
                Text("map.select.city")
            }
        }
    }
}
