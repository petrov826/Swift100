//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool
    
    let numberDisplayFormat = FloatingPointFormatStyle<Double>.Currency.currency(code: Locale.current.currencyCode ?? "USD")
    
    // let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount * (tipSelection / 100)
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = totalAmount / peopleCount
        
        return amountPerPerson
    }
    
    
    var body: some View {
        // enable "Number of people" picker to navigate new view
        NavigationView {
            Form {
                Section {
                    TextField(
                        "amount",
                        value: $checkAmount,
                        format: numberDisplayFormat
                    )
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    // note: $numberOfPeople is confusing
                    // when we choose fisrt element(2 people),
                    // $numberOfPeople will be 0 not 2.
                    // because it's 0th element
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<10) {
                            Text("\($0) people")
                        }
                    }
                    // Text("\(numberOfPeople)")
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        // ForEach(tipPercentages, id: \.self) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    // .pickerStyle(.segmented)
                } header: { // using second trailing closure
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Total amount")
                }
                
                Section {
                    Text(totalPerPerson, format: numberDisplayFormat)
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                // show done button above the keyboard
                // push it right hand side with Spacer
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
