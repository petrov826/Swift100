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
        ScrollView {
            // using VStack, all views inside will be created
            // at first. we can avoid it by using LazyVStack
            // LazyVStack takes full available space,
            // so no need for .frame(maxWidth: .infinity)
            LazyVStack {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            // .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
