//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/05/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View  {
        NavigationView {
            TextEditor(text: $notes)
                .padding()
                .navigationTitle("Notes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
