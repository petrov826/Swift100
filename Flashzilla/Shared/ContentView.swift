//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/30.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text("Hello world")
            .padding()
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    print("active")
                } else if newPhase == .inactive {
                    print("inactive")
                } else if newPhase == .background {
                    print("background")
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
