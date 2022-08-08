//
//  FriendInfoForm.swift
//  MyFriends
//
//  Created by peterpetrov on 2022/08/07.
//

import SwiftUI

struct FriendInfoForm: View {
    @Binding var friend: Friend
    
    var body: some View {
        VStack {
            Form {
                Section("Name") {
                    TextField("Your friend name", text: $friend.name)
                }
                Section("Description") {
                    TextEditor(text: $friend.description)
                }
            }
            
            Image(friend.imageName)
        }
    }
}

struct FriendInfoForm_Previews: PreviewProvider {
    static var previews: some View {
        FriendInfoForm(friend: .constant(Friend.example))
    }
}
