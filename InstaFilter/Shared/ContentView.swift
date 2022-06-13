//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/06/06.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var showingPicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingPicker = true
            }
        }
        .sheet(isPresented: $showingPicker) {
            ImagePicker()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
