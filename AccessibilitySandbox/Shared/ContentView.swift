//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/07/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // BYW, who is this girl?
            Image(decorative: "character")
                .resizable()
                .scaledToFit()
                .accessibilityHidden(true)
            
            // these Text are not 1 View.
            // but they should be combined for better accessibility
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        // option 1
        // there will be a small pause when voiceover reads them
        .accessibilityElement(children: .combine)
        // option 2
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
