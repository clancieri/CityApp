//
//  Fonts.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//

import SwiftUI
import CoreFoundation

struct Fonts {
    static func bold(size: CGFloat) -> Font {
        return Font.custom(FontName.SNProBold.rawValue, size: size)
    }
    
    static func semibold(size: CGFloat) -> Font {
        return Font.custom(FontName.SNProSemiBold.rawValue, size: size)
    }
    
    static func medium(size: CGFloat) -> Font {
        return Font.custom(FontName.SNProMedium.rawValue, size: size)
    }
    
    static func regular(size: CGFloat) -> Font {
        return Font.custom(FontName.SNProRegular.rawValue, size: size)
    }
}

public enum FontName: String, CaseIterable {
    case SNProBold = "SFProDisplay-Bold"
    case SNProSemiBold = "SFProDisplay-Semibold"
    case SNProMedium = "SFProDisplay-Medium"
    case SNProRegular = "SFProDisplay-Regular"
}
