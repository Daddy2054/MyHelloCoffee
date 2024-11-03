//
//  Webservice.swift
//  MyHelloCoffee
//
//  Created by Jean on 02/11/24.
//

import Foundation
enum NetworkError: Error {
    case badRequest
    case decodingError
    case badUrl
}

class Webservice {
    private var baseURL: URL
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func getOrders() async throws -> [Order] {
        
        // https://metal-happy-parsnip.glitch.me/orders
        guard let url = URL(string: Endpoints.allOrders.path, relativeTo: baseURL) else {
            throw NetworkError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let orders = try? JSONDecoder().decode([Order].self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return orders
    }
    
}
