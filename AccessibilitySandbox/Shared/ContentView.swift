//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/07/26.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 100
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Value: \(value)")
            
            // it doesn't talk about current `score`
            // when this button tapped, voiceover says "Increment"
            Button("Increment") {
                value += 1
            }
            
            Button("Decrement") {
                value -= 1
            }
            .accessibilityElement()
            .accessibilityLabel("Value")
            .accessibilityValue(String(value))
            .accessibilityAdjustableAction { direction in
                switch direction {
                case .increment:
                    value += 1
                case .decrement:
                    value -= 1
                default:
                    print("Not handled")
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
