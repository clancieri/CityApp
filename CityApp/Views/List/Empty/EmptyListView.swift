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
                .padding(.bottom, 15)
            
            Text("empty.list.title")
                .font(Fonts.semibold(size: 20))
                .foregroundStyle(.black)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
            Text("empty.list.subtitle")
                .font(Fonts.medium(size: 16))
                .foregroundStyle(.black)
            Spacer()
        }
        .background(Color.background)
        .multilineTextAlignment(.center)
        .padding()
    }
}

#Preview {
    EmptyListView()
}
