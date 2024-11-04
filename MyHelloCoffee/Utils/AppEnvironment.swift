//
//  Appenvironment.swift
//  MyHelloCoffee
//
//  Created by Jean on 03/11/24.
//

import Foundation

enum Endpoints {
    case allOrders
    case placeorder
    case deleteOrder(Int)
    case updateOrder(Int)
    
    var path: String {
        switch self {
        case .allOrders:
            return "/orders"
        case .placeorder:
            return "/new-order"
        case .deleteOrder(let orderId):
            return "/v2/orders/\(orderId)"
        case .updateOrder(let orderId):
            return "/orders/\(orderId)"
        }
    }
}

struct Configuration {
    lazy var environment: AppEnvironment = {
        // eread value from environment variable
        guard let env = ProcessInfo.processInfo.environment["ENV"] else {
            return AppEnvironment.dev
        }
        if env == "TEST" {
            return AppEnvironment.test
        }
        return AppEnvironment.dev
    }()
}
enum AppEnvironment: String {
    case dev
    case test
    
    var baseURL: URL {
        switch self {
        case .dev:
            return URL(string: "https://polarized-open-whitefish.glitch.me")!
        case .test:
            return URL(string: "https://metal-happy-parsnip.glitch.me")!
        }
    }
    
}
