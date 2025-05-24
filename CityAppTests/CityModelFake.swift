//
//  CityModelFake.swift
//  CityApp
//
//  Created by Constanza Lancieri on 24/05/2025.
//
@testable import CityApp

extension CityModel {
    static func fake(id: Int = 1, name: String = "Buenos Aires") -> CityModel {
        CityModel(country: "AR", name: name, id: id, coord: .init(lon: 30.3432, lat: -12.45345))
    }
}
