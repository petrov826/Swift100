//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/06/06.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = 0.0
    
    var body: some View {
        VStack {
            Text("Hello everyone!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
            
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
        .onChange(of: blurAmount) { newValue in
            print("New value is \(newValue)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
