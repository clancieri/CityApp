//
//  CitiesContentView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 18/05/2025.
//

import SwiftUI

struct CitiesContentView: View {
    @ObservedObject var viewModel: CitiesContentViewModel
    
    var body: some View {
        NavigationStack {
            Text("Cities")
            VStack {
                CitiesListView(cities: viewModel.cities)
            }
        }
        .onAppear {
            Task {
                await viewModel.getCities()
            }
        }
        .padding()
    }
}

#Preview {
    CitiesContentView(viewModel: CitiesContentViewModel())
}
