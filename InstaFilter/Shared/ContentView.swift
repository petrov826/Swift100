//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/06/06.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = 0.0 {
        didSet {
            // when we change the value with Button,
            // it will be printed.
            // but when using Slider, nothing will be printed.
            // that's because value change via binding
            // doesn't trigger property observer
            // So, how should we achieve that?
            print("New value is \(blurAmount)")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello everyone!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
            
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
