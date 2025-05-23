//
//  SwiftUIModifiers.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import Foundation
import SwiftUI

struct DisplaySearchView: ViewModifier {
    let isVisible: Bool
    @Binding var text: String
    
    func body(content: Content) -> some View {
        if isVisible {
            content
                .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always))
        } else {
            content
        }
    }
}

extension View {
    func showSearchBar(_ isVisible: Bool, text: Binding<String>) -> some View  {
        modifier(DisplaySearchView(isVisible: isVisible, text: text))
    }
}
