//
//  CitiesListView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import SwiftUI

struct CitiesListView: View {
    let cities: [CitiesListModel]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(cities) { city in
                    CitiesCellView(city: city)
                }
                .listRowBackground(Color.clear)
                .frame(height: 44)
                .padding()
            }
        }
        .scrollIndicators(.hidden)
        .listStyle(.plain)
    }
}
