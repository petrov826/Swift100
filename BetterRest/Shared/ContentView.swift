//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/14.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var recommendedSleepTime = defaultSleepTime
    
    @State private var alertTitile = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    // Swift doesn't know which of wakeUp or defaultWakeTime
    // should be initialized first,
    // "var wakeUp = defaultWakeTime" can't be compiled successfully.
    // we can avoid it by marking static.
    // Here's the order.
    // 1. compute defaultWakeTime
    // 2. assign the value to wakeUp
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    static var defaultSleepTime: Date {
        var components = DateComponents()
        components.hour = 22
        components.minute = 38
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            // instead of VStack, Form is great for this app
            Form {
                Section {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .onChange(of: wakeUp) { _ in
                            calculateBedtime()
                        }
                } header: {
                    Text("When do you want to wake up?")
                        .font(.headline)
                }
                
                Section {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                        .onChange(of: sleepAmount) { _ in
                            calculateBedtime()
                        }
                } header: {
                    Text("Desired amount of sleep")
                        .font(.headline)
                }
                
                Section {
                    // Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 0...10)
                    Picker("coffeeAmount", selection: $coffeeAmount) {
                        ForEach(1..<11) {
                            Text("\($0) \($0 == 1 ? "cup" : "cups")")
                        }
                    }
                    .onChange(of: coffeeAmount) { _ in
                        calculateBedtime()
                    }
                } header: {
                    Text("Daily coffee intake")
                        .font(.headline)
                }
                
                HStack {
                    Text("You should sleep at")
                    Text(recommendedSleepTime.formatted(date: .omitted, time: .shortened))
                        .font(.title)
                }
                
                
            }
            .navigationBarTitle("BetterRest")
            // .toolbar {
            //     Button("Calculate", action: calculateBedtime)
            // }
            .alert(alertTitile, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            // wakeUp's type is Date.
            // the model expects double. If a man waked up at 5AM,
            // it will be 5 hours = 5 * 3600 seconds = 18000
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hourInSec = (components.hour ?? 0) * 3600
            let minuteInSec = (components.minute ?? 0) * 60

            let predition = try model.prediction(
                wake: Double(hourInSec + minuteInSec),
                estimatedSleep: sleepAmount,
                coffee: Double(coffeeAmount)
            )
            // let sleepTime = wakeUp - predition.actualSleep
            recommendedSleepTime = wakeUp - predition.actualSleep
            // alertTitile = "Your ideal bedtime is..."
            // alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            // alertTitile = "Error"
            // alertMessage = "Sorry, there was a problem calculating your bedtime"
        }
        // showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
