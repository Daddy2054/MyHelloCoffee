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
    
    var path: String {
        switch self {
        case .allOrders:
            return "/test/orders"
        case .placeorder:
            return "/test/new-order"
            
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
