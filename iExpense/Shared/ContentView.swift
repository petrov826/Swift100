//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/31.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount1 = UserDefaults.standard.integer(forKey: "Tap")
    // another option
    // nice and short syntax. but can't score complex data type
    @AppStorage("tapCount") private var tapCount2 = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Tap Count1: \(tapCount1)") {
                tapCount1 += 1
                UserDefaults.standard.set(tapCount1, forKey: "Tap")
            }
            
            Button("Tap Count2: \(tapCount2)") {
                tapCount2 += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
