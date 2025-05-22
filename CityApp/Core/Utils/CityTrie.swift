//
//  CityTrie.swift
//  CityApp
//
//  Created by Constanza Lancieri on 19/05/2025.
//
class TrieNode {
    var children: [Character: TrieNode] = [:]
    var cities: [CityModel] = []
}

class CityTrie {
    private let root = TrieNode()

    func insert(_ city: CityModel) {
        var current = root
        for char in city.name.lowercased() {
            if current.children[char] == nil {
                current.children[char] = TrieNode()
            }
            current = current.children[char]!
        }
        current.cities.append(city)
    }

    func search(prefix: String) -> [CityModel] {
        var current = root
        for char in prefix.lowercased() {
            guard let next = current.children[char] else {
                return []
            }
            current = next
        }
        return collectCities(node: current)
    }

    private func collectCities(node: TrieNode) -> [CityModel] {
        var result = node.cities
        for child in node.children.values {
            result += collectCities(node: child)
        }
        return result
    }
}
