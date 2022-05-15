//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by peterpetrov on 2022/05/08.
//

import SwiftUI

struct AddressView: View {
    // monitoring the source of truth
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.street)
                TextField("City", text: $order.city)
                TextField("Zip Code", text: $order.zipcode)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check Out")
                }
            }
            // disable if order is not valid
            .disabled(!order.hasValidAddress)
        }
        .navigationTitle("Address Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        // dummy and empty instance
        NavigationView {
            AddressView(order: Order())
        }
    }
}
