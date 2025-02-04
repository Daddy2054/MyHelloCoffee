//
//  NumberFormatter+Extensions.swift
//  MyHelloCoffee
//
//  Created by Jean on 03/11/24.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
}
