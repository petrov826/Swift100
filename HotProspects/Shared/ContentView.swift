//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/08.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.white
    
    var body: some View {
        VStack {
            Image("example")
                .interpolation(.none) // remove blur
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity)
                .background(backgroundColor)
                .ignoresSafeArea()
            
            Text("Change background color")
                .padding()
                // contextMenu pops up when it got long-tapped
                // (it is hidden by default)
                // we have to think "Is this a best option for user?"
                // he/she may not realize the functionality
                .contextMenu {
                    Button("Red") { backgroundColor = .red }
                    Button("Yellow") { backgroundColor = .yellow }
                    Button("Blue") { backgroundColor = .blue }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
