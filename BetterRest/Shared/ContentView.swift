//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/14.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack {
            // two-way binding!
            Stepper(
                "\(sleepAmount.formatted()) hours",
                value: $sleepAmount,
                in: 4...12,
                step: 0.25
            )
            
            DatePicker(
                "Please enter a date",
                selection: $wakeUp,
                // today or later.
                // we also have ...Date.now
                in: Date.now...,
                displayedComponents: .date // or .hourAndMinute
            )
                .labelsHidden()
            
            // Swift will rearange format
            // based on user's locale or region
            Text(Date.now, format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.day().month().year())
            Text(Date.now.formatted(date: .long, time: .shortened))
            // date only
            Text(Date.now.formatted(date: .long, time: .omitted))
        }
    }
    
    func trivialExample() {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        // .current means "use the user’s current calendar"
        let date = Calendar.current.date(from: components) ?? Date.now
        print(date)
    }
    
    func trivialExample2() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        print(hour, minute)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
