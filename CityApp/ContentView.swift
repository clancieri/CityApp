//
//  ContentView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 18/05/2025.
//

import SwiftUI

struct ContentView: View {
    let service = CitiesService()
    @State var cities: [CityModel] = []
    
    var body: some View {
        ScrollView {
            LazyVStack {
                Text("\(cities.count)")
                ForEach(cities, id: \.id) { city in
                    VStack {
                        Text(city.name)
                    }
                }
            }
        }
        .onAppear {
            Task {
                let result = await service.getCities()
                
                switch result {
                case .success(let cities):
                    self.cities = cities
                case .failure(let failure):
                    print(failure)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
