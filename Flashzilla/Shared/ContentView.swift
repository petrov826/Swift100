//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/30.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0
    
    var body: some View {
        Text("Hello world")
            .padding()
            .background(.green)
            .scaleEffect(scale)
            .onTapGesture {
                if reduceMotion {
                    scale *= 1.2
                } else {
                    withAnimation {
                        scale *= 1.2
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
