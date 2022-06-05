//
//  UserDetailView.swift
//  FriendFace
//
//  Created by peterpetrov on 2022/06/05.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        List {
            Text("Age: \(user.age)")
            Text("Status: \(user.isActive ? "Active" : "Not Active")")
            Text("Registered: \(user.registered)")
            
            Section {
                Text("Company: \(user.company)")
                Text("Address: \(user.address)")
            }
            
            Section("Tags") {
                ForEach(user.tags, id: \.self) { tag in
                    Text(tag)
                }
            }
            
            Section("Friends") {
                ForEach(user.friends, id: \.id) { friend in
                    Text(friend.name)
                }
            }
        }
        .navigationTitle(user.name)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailView(user: User.example)
        }
    }
}
