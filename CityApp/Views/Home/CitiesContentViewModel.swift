//
//  CitiesContentViewModel.swift
//  CityApp
//
//  Created by Constanza Lancieri on 25/05/2025.
//
import SwiftUI

final class CitiesContentViewModel {
    
    /// This functions determines if the navigation should use a stack or a split view based on the device size
    func shouldNavigateWithStack(_ verticalSizeClass: UserInterfaceSizeClass?) -> Bool {
        guard verticalSizeClass == .regular || (verticalSizeClass == .compact && !isLargePhone)
        else { return false }
        return true
    }
    func shouldNavigateWithSplit(_ verticalSizeClass: UserInterfaceSizeClass?) -> Bool {
        guard verticalSizeClass == .compact && isLargePhone else { return false }
        return true
    }
    
    var isLargePhone: Bool {
        let bounds = UIScreen.main.bounds
        let width = min(bounds.width, bounds.height)
        guard width >= 428 else { return false } // iPhone Pro Max, Plus models width
        return true
    }
}
