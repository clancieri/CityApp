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
            return .failure(NetworkingError.invalidUrl)
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return .failure(NetworkingError.invalidResponse) }
            
            let cities = try JSONDecoder().decode([CityModel].self, from: data)
            return .success(cities)
        } catch {
            return .failure(NetworkingError.invalidData)
        }
    }
}

enum NetworkingError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
}
