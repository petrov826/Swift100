//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/04/12.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Created \(text)")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<20) { row in
                NavigationLink {
                    // destination
                    Text("Detail \(row)")
                } label: {
                    // this is Button
                    Text("Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
