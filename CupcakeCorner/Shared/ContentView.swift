//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/05/04.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("User Name", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create Account") {
                    print("creating an account")
                }
            }
            // .disabled(username.isEmpty || email.isEmpty)
            .disabled(disableForm) // we can computed property too
        }
    }
    
    var disableForm: Bool {
        username.count < 5 || email.count < 8
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
