//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onTapGesture(count: 2) {
                print("Double tapped!")
            }
            .onLongPressGesture(minimumDuration: 2) {
                print("Long pressed!")
            // when the pressing state of the gesture changes
            } onPressingChanged: { inProgress in
                print("In progress?: \(inProgress)")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
