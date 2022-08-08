//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/08.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    // user comes from parent or ancestor view
    // @EnvironmentObject is a property wrapper
    // for class conforms to ObservableObject
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct ContentView: View {
    // source of truth here
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            EditView()
                // share `user` with child views
                .environmentObject(user)
            DisplayView()
                .environmentObject(user)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
