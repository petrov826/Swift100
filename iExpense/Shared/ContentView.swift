//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/31.
//

import SwiftUI

// if we use class for UserStruct,
// user is pointing to the instance of this class(not values)
// when we update @State user, new instance will be created
// but user is still pointing to the instance,
// the change will not be reflected(value changes will not be shared)

// if we use struct for UserStruct
// user is pointing to the values themself(=struct)
// when we update @State user, the old values will be discarded
// and new one will be assigned.
// so Text and TextField will access the same values
// and the change will be reflected(value changes will be shared)
struct UserStruct {
    var firstName = "Tim"
    var lastName = "Johnson"
}

// we can share an instance of this class
// across multiple views
class UserClass: ObservableObject {
    @Published var firstName = "Jack"
    @Published var lastName = "Bill"
}

struct ContentView: View {
    @State private var userStruct = UserStruct()
    @StateObject var userClass = UserClass()
    
    var body: some View {
        Form {
            Section("Struct") {
                Text("Your name is \(userStruct.firstName) \(userStruct.lastName)")
                            
                TextField("First Name: ", text: $userStruct.firstName)
                TextField("Last Name: ", text: $userStruct.lastName)
            }
            
            Section("Class") {
                Text("Your name is \(userClass.firstName) \(userClass.lastName)")
                            
                TextField("First Name: ", text: $userClass.firstName)
                TextField("Last Name: ", text: $userClass.lastName)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
