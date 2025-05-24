//
//  CitiesService.swift
//  CityApp
//
//  Created by Constanza Lancieri on 18/05/2025.
//
import Foundation

protocol CitiesServiceProtocol {
    func getCities() async -> Result<[CityModel], Error>
}

struct CitiesService: CitiesServiceProtocol {
    func getCities() async -> Result<[CityModel], Error> {
        let mainUrl = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
        
        guard let url = URL(string: mainUrl) else {
            return .failure(ServiceError.invalidUrl)
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                return .failure(ServiceError.invalidResponse) }
            
            let cities = try JSONDecoder().decode([CityModel].self, from: data)
            return .success(cities)
        } catch {
            return .failure(ServiceError.invalidData)
        }
    }
}
