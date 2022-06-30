//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/06/30.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    // operator overloading
    // static keywords means
    // "< operator belongs to struct itself"
    // lhs: left hand side
    // rhs: right hand side
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.firstName < rhs.firstName
    }

}

struct ContentView: View {
    // get sorted array
    let values = [1, 5, 3, 6, 2, 9].sorted()
    
    let users = [
        User(firstName: "Sara", lastName: "Lind"),
        User(firstName: "Tim", lastName: "Jackson"),
        User(firstName: "Harry", lastName: "Potter")
    ].sorted()
    // when we want to sort users,
    // .sorted { $0.firstName < $1.firstName } will work.
    // However, it's better to separate layout and data.
    // In other word, data should know how to sort.
    // Let's put the sorting rule inside of User struct.
    
    var body: some View {
        VStack {
            List(values, id: \.self) {
                Text("\($0)")
            }
            
            List(users) { user in
                Text("\(user.firstName) \(user.lastName)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
