//
//  CityApp.swift
//  CityApp
//
//  Created by Constanza Lancieri on 18/05/2025.
//

import SwiftUI

@main
struct CityApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = CitiesContentViewModel()
            CitiesContentView(viewModel: viewModel)
        }
    }
}
