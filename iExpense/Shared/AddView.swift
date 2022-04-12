//
//  AddView.swift
//  iExpense (iOS)
//
//  Created by peterpetrov on 2022/04/06.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var currencyCode = "USD"
    
    let types = ["Bussiness", "Personal"]
    let currencyCodes = ["USD", "EUR", "JPY"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                // when I picked currencyCode, format not updated...
                // maybe because @State currencyCode is used in modifier
                // not in View. I'll find a way to solve this.
                TextField("Amount", value: $amount, format: .currency(code: currencyCode))
                    .keyboardType(.decimalPad)
                
                // Text(currencyCode)
                
                Picker("Currency Code", selection: $currencyCode) {
                    ForEach(currencyCodes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount, currencyCode: currencyCode)
                    expenses.items.append(item)
                    // no need to set back
                    // ContentView.showingAddExpense to false
                    // Swift takes care of it
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        // passing dummy object
        AddView(expenses: Expenses())
    }
}
