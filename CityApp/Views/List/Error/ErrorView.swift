//
//  ErrorView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 20/05/2025.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack {
            Image("errorCat")
                .resizable()
                .scaledToFit()
                .frame(height: 250)
                .padding(.horizontal)
            
            Text("list.error.title")
                .font(Fonts.semibold(size: 20))
                .foregroundStyle(.black)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
            
            Text("list.error.subtitle")
                .font(Fonts.medium(size: 16))
                .foregroundStyle(.black)
                .padding(.horizontal, 40)
            
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding()
    }
}

#Preview {
    ErrorView()
}
