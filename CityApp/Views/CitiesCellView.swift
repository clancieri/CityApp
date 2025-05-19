//
//  CitiesCellView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//
import SwiftUI

struct CitiesCellView: View {
    let city: CitiesListModel
    @State var isFavourite: Bool = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(city.title)
                Text(city.subtitle)
            }
            
            Spacer()
            
            Image(systemName: isFavourite ? "star.fill" : "star")
                .foregroundStyle(.yellow)
                .onTapGesture {
                    isFavourite.toggle()
                }
        }
    }
}
