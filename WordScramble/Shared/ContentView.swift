//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/20.
//

import SwiftUI

struct ContentView: View {
    let people = ["Tom", "Bob", "Sam"]
    
    var body: some View {
        // List looks similar to Form
        // List is used for presenting data.
        // Form is used for user input area.
        List {
            Section("Section 1") {
                Text("static row 1")
                Text("static row 2")
            }
            
            Section("Section 2") {
                ForEach(0..<3) {
                    Text("dynamic row \($0)")
                }
            }
            
            Section("Section 3") {
                Text("static row 3")
                Text("static row 4")
            }
        }
        // no holizontal padding
        .listStyle(.grouped)
        
        
        // instead of ForEach,
        // we can use List like below
        // I don't what's the difference between them
        // List(people, id: \.self) {
        //     Text($0)
        // }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
