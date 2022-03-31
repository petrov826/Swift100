//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/31.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        VStack {
            Text("Hello \(name)! I'm second view!!")
            
            Button("dismiss") {
                dismiss()
            }
        }
    }
}
struct ContentView: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Peter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
