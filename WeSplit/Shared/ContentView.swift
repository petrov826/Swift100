//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/02/22.
//

import SwiftUI

struct ContentView: View {
    // use @State to make computed property mutable
    // @State enables property one-way binding
    // (computed property can read)
    // prepend $ to make the property two-way binding
    // (computed property can read and write back)
    @State private var name = ""
    @State private var tapCount = 0
    
    var body: some View {
        Form {
            TextField("type your name here", text: $name)
            // this is not two-way binding
            Text("Your name is \(name)")
            
            // this is not two-way binding too
            // Button("tap count: \(tapCount)") is
            // just reading state property, not writing back
            // we can change state in closure without $
            Button("tap count: \(tapCount)") {
                tapCount += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
