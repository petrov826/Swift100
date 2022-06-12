//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/06/06.
//

import SwiftUI

struct ContentView: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Text("Hello everyone")
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                showingConfirmation = true
            }
            // confirmationDialog has exactly same interface as
            // alert modifier. we can switch easily
            .confirmationDialog("Change Background Color", isPresented: $showingConfirmation) {
                Button("Red") { backgroundColor = .red }
                Button("Green") { backgroundColor = .green }
                Button("Blue") { backgroundColor = .blue }
                // Cancel button is built-in.s
                // we can override it's text
                // like "Wait! Please Stop!!"
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Select a new color")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
