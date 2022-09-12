//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/30.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello")
            // Spacer doesn't respond tapping
            Spacer()
                .frame(height: 100)
            Text("World")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("VStack tapped")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
