//
//  ContentView.swift
//  SnowSeeker
//
//  Created by peterpetrov on 2022/10/17.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    @State private var showingUser = false
    
    var body: some View {
        Text("Hello world")
            .onTapGesture {
                selectedUser = User()
                showingUser = true
            }
            // if selectedUser is not nil, show the sheet
            .alert("Welcome", isPresented: $showingUser, presenting: selectedUser) { user in
                Button("OK") { }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
