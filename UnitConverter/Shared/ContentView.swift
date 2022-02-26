//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/02/26.
//

import SwiftUI

enum TimeUnit: String, CaseIterable {
    case second, minute, hour, day
}

struct ContentView: View {
    @State var inputValue: Double = 60.0
    @State private var inputUnit: TimeUnit = .minute
    @State private var outputUnit: TimeUnit = .hour
    
    @FocusState private var inputFieldFocused: Bool
    
    var inputValueInSeconds: Double {
        switch inputUnit {
        case .second: return inputValue
        case .minute: return inputValue * 60.0
        case .hour: return inputValue * 60.0 * 60.0
        case .day: return inputValue * 60.0 * 60.0 * 24.0
        }
    }
    
    var outputValueInSelectedUnit: Double {
        guard inputValueInSeconds > 0 else {
            return 0.0
        }
        switch outputUnit {
        case .second: return Double(inputValueInSeconds)
        case .minute: return Double(inputValueInSeconds) / 60
        case .hour: return Double(inputValueInSeconds) / 60 / 60
        case .day: return Double(inputValueInSeconds) / 60 / 60 / 24
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("input value here", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputFieldFocused)
                    
                    Picker("input time unit", selection: $inputUnit) {
                        ForEach(TimeUnit.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    // Text("input values in seconds: \(inputValueInSeconds)")
                } header: {
                    Text("Type a value and choose input unit")
                }
                
                Section {
                    Picker("output time unit", selection: $outputUnit) {
                        ForEach(TimeUnit.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Choose output unit")
                }
                
                Section {
                    Text("\(inputValue.formatted()) \(inputUnit.rawValue) is \(outputValueInSelectedUnit.formatted()) \(outputUnit.rawValue)")
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Time Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputFieldFocused = false
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
