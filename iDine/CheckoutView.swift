//
//  CheckoutView.swift
//  iDine
//
//  Created by peterpetrov on 2023/02/07.
//

import SwiftUI

enum PaymentTypes: String, CaseIterable {
    case cash = "Cash"
    case credit = "Credit"
    case iDinePoints = "iDinePoints"
}

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    @State private var paymentType: PaymentTypes = .cash
    
    var body: some View {
        VStack {
            Picker("How do you want to pay?", selection: $paymentType) {
                ForEach(PaymentTypes.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CheckoutView()
                .environmentObject(Order())
        }
    }
}
