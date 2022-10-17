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
    var body: some View {
        Text("Hello world")
            .onTapGesture {
                selectedUser = User()
            }
            // if selectedUser is not nil, show the sheet
            .sheet(item: $selectedUser) { user in
                // the type of `user` is User not User?
                // no unwrapping needed
                Text(user.id)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
