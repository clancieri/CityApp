//
//  EmptyListView.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        VStack {
            Image("empty")
                .resizable()
                .scaledToFit()
                .frame(height: 220)
                .padding()
            
            Text("No se han encontrado resultados para tu búsqueda")
                
            Text("Intenta usar otras palabras")
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding()
        
    }
}

#Preview {
    EmptyListView()
}
