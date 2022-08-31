//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/30.
//

import SwiftUI

struct ContentView: View {
    @State private var currentZoomAmount = 0.0
    @State private var finalZoomAmount = 1.0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, world!")
                .scaleEffect(currentZoomAmount + finalZoomAmount)
            Text("currentZoomAmount: \(currentZoomAmount)")
            Text("finalZoomAmount: \(finalZoomAmount)")
        }
        .gesture(
            MagnificationGesture()
                .onChanged { amount in
                    print(amount)
                    currentZoomAmount = amount - 1
                }
                .onEnded { amount in
                    finalZoomAmount += currentZoomAmount
                    currentZoomAmount = 0.0
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
