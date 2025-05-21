//
//  SwiftUIModifiers.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import Foundation
import SwiftUI

struct SkeletonableView: ViewModifier {
    let reason: RedactionReasons
    
    func body(content: Content) -> some View {
        content
            .redacted(reason: reason)
    }
}

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
    func skeletonView(reason: Bool) -> some View {
        modifier(SkeletonableView(reason: reason ? .placeholder : []))
    }
    
    func showSearchBar(_ isVisible: Bool, text: Binding<String>) -> some View  {
        modifier(DisplaySearchView(isVisible: isVisible, text: text))
    }
}
