//
//  CitiesCellView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//
import SwiftUI

struct CitiesCellView: View {
    let city: CitiesListModel
    @State var isFavorite: Bool
    var onTapFavorite: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(city.title)
                    .font(Fonts.semibold(size: 16))
                Text(city.subtitle)
                    .font(Fonts.regular(size: 14))
            }
            
            .padding(.leading, 5)
            
            Spacer()
            
            Image(systemName: isFavorite ? "star.fill" : "star")
                .foregroundStyle(Color.yellowGold)
                .onTapGesture {
                    isFavorite.toggle()
                    onTapFavorite()
                }
                .padding(.trailing, 5)
        }
        .padding()
        .frame(height: 63)
        .background(Color.white)
        .cornerRadius(20)

    }
}
