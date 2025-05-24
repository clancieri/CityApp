//
//  FavoriteButton.swift
//  CityApp
//
//  Created by Constanza Lancieri on 24/05/2025.
//

import SwiftUI

struct FavoriteButton: View {
    let showFavorites: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Text(!showFavorites ? "favorites.button.title" : "allcities.button.title")
                .font(Fonts.medium(size: 13))
                .foregroundStyle(Color.yellowText)
                .padding(.horizontal, 12)
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(
                        cornerRadius: 20,
                        style: .continuous
                    )
                    .fill(Color.yellowButton)
                )
        }
    }
}
