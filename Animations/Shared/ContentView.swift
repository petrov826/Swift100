//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonScale = 1.0
    @State private var textScale = 1.0
    @State private var rotationAmount = 0.0
    
    var body: some View {
        VStack {
            // 1st way: implicit animation
            Button("Tap Me") {
                buttonScale += 0.5
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(buttonScale)
            // implicit animation
            .animation(.easeIn(duration: 0.2).delay(0.5), value: buttonScale)
            
            Spacer()
            
            // 2nd way: animation with binding
            // this is just a showcase
            HStack(spacing: 50) {
                Text("Hello")
                    // scaleEffect doesn't change frame of the view
                    .scaleEffect(textScale)
                Stepper("Text Scale", value: $textScale.animation(), in: 1...5)
                    .labelsHidden()
            }
            
            Spacer()
            
            // 3rd way: explicit animation
            Button("Tap Me") {
                // any change inside withAnimation{ } will be animated
                withAnimation {
                    rotationAmount += 180
                }
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(rotationAmount), axis: (x: 0, y: 1, z: 0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
