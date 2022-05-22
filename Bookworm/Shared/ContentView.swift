//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/05/22.
//

import SwiftUI

struct PushButton: View {
    let title: String
    // @State var isOn: Bool // this view will have source of truth
    @Binding var isOn: Bool // referencing source of truth
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(
                colors: isOn ? onColors : offColors,
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView: View {
    @State private var rememberMe = false
    
    var body: some View {
        Form {
            // referencing the source of truth
            Toggle("Remember Me", isOn: $rememberMe)
            
            // Once this button created, boolean value are passing
            // to this view and it will have its own.
            // In other words, this view doesn't reference the value.
            // So there're 2 sources of truth now...
            // PushButton(title: "Remember Me", isOn: rememberMe)
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "ON" : "OFF")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
