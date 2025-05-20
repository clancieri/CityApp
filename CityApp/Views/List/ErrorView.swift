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
            
            Text("Lo sentimos")
                .font(Fonts.semibold(size: 20))
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
            
            Text("Ha ocurrido un error inesperado. Intenta de nuevo más tarde")
                .font(Fonts.medium(size: 16))
                .padding(.horizontal, 40)
            
            Spacer()
            
            Button {
                //TODO: -Add action
            } label: {
                Text("Reintentar")
                    .font(Fonts.medium(size: 18))
                    .padding(.horizontal, 35)
                    .padding(.vertical, 12)
                    .foregroundColor(.purple)
                    .background(
                        .purple.opacity(0.2),
                        in: Capsule()
                    )
            }
            .padding(.top, 30)
            
        }
        .multilineTextAlignment(.center)
        .padding()
    }
}

#Preview {
    ErrorView()
}
