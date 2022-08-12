//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("Milk")
                // NOTE: swipreActions are hidden by default
                // we need to think carefully it is right time to use.
                .swipeActions {
                    Button(role: .destructive) {
                        print("Deleting this item")
                    } label: {
                        Label("delete", systemImage: "trash")
                    }
                    // .tint(.red) // this works fine too
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("Pinning this item")
                    } label: {
                        Label("pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
