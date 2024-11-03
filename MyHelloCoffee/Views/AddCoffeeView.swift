//
//  AddCoffeeView.swift
//  MyHelloCoffee
//
//  Created by Jean on 03/11/24.
//

import SwiftUI

struct AddCoffeeView: View {
    
    @State var name: String = ""
    @State var coffeeName: String = ""
    @State var price: String = ""
    @State var coffeeSize: CoffeeSize = .medium
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
                .accessibilityIdentifier("name")
            TextField("Coffee name", text: $coffeeName)
                .accessibilityIdentifier("coffeeName")
            TextField("Price", text: $price)
                .accessibilityIdentifier("price")
            Picker("Select size", selection: $coffeeSize) {
                ForEach(CoffeeSize.allCases, id: \.rawValue) { size in
                    Text(size.rawValue).tag(size)
                }
            }.pickerStyle(.segmented)
            
            Button("Place Order") {
                
            }.accessibilityIdentifier("placeOrderButton")
                .frame(maxWidth: .infinity, minHeight: 40)
        }
    
    }
}

#Preview {
    AddCoffeeView()
}
