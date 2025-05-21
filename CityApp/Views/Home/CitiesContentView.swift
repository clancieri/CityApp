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
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @State var navigationPath = NavigationPath()
    
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
                Text("Selecciona una ciudad")
            }
        }
    }
}
