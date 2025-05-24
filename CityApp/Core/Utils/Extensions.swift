//
//  Extensions.swift
//  CityApp
//
//  Created by Constanza Lancieri on 24/05/2025.
//
extension String {
    func flagEmoji() -> String {
        let base: UInt32 = 127397
        var emoji = ""
        for scalar in self.uppercased().unicodeScalars {
            guard let scalarValue = UnicodeScalar(base + scalar.value) else { continue }
            emoji.unicodeScalars.append(scalarValue)
        }
        return emoji
    }
}
