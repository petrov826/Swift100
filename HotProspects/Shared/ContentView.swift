//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/08.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
    // @Published var value = 0
    var value = 0 {
        willSet {
            objectWillChange.send()
            // we can do extra stuff here
            // range check, write new value in database, or so
        }
    }
    
    init() {
        // add 1 to self.value every second
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}


struct ContentView: View {
    @StateObject var updater = DelayedUpdater()
    
    var body: some View {
        Text("value: \(updater.value)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
