//
//  OrderDetailView.swift
//  MyHelloCoffee
//
//  Created by Jean on 04/11/24.
//


import SwiftUI

struct OrderDetailView: View {
    
    let orderId: Int
    @EnvironmentObject private var model: CoffeeModel
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            
            if let order = model.orderById(orderId) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(order.coffeeName)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .accessibilityIdentifier("coffeeNameText")
                    Text(order.size.rawValue)
                                        .opacity(0.5)
                    Text(order.total as NSNumber, formatter: NumberFormatter.currency)
                    
                    HStack {
                        Spacer()
                        Button("Delete Order", role: .destructive) {
                            
                        }
                        Button("Edit Order") {
                            isPresented = true
                        }.accessibilityIdentifier("editOrderButton")
                        Spacer()
                    }
                }.sheet(isPresented: $isPresented) {
                    AddCoffeeView()
                }
            }
            
            Spacer()
            
        }.padding()
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        var config = Configuration()
        OrderDetailView(orderId: 1).environmentObject(CoffeeModel(webservice: Webservice(baseURL: config.environment.baseURL)))
    }
//    static var previews: some View {
//        var config = Configuration()
//        ContentView().environmentObject(CoffeeModel(webservice: Webservice(baseURL: config.environment.baseURL)))
//    }
}

