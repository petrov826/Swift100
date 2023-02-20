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
    
    @State private var addLoyalityDetails = false
    @State private var loyalityNumber = ""
    
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    
    @State private var showingPaymentAlert = false
    
    var totalPrice: String {
        let total = Double(order.total)
        let tip = total * Double(tipAmount) / 100
        return (total + tip).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section {
                // `$` indicates "this is 2-way binding"
                // it will
                // 1. read the value of `paymentType`
                // 2. write user input back to the property
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(PaymentTypes.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                
                Toggle("Add iDine loyality card", isOn: $addLoyalityDetails.animation())
                if addLoyalityDetails {
                    TextField("Enter your iDine ID", text: $loyalityNumber)
                }
            }
            
            Section("Add a tip?") {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total: \(totalPrice)") {
                Button("Confirm Order") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order Confirmed", isPresented: $showingPaymentAlert) {
            
        } message: {
            Text("Your total was \(totalPrice) - Thank you!")
        }
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
