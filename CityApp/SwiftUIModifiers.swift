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

extension View {
    func skeletonView(reason: Bool) -> some View {
        modifier(SkeletonableView(reason: reason ? .placeholder : []))
    }
}
