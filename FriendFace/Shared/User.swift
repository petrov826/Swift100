//
//  User.swift
//  FriendFace
//
//  Created by peterpetrov on 2022/06/05.
//

import Foundation

struct User: Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
    
    static let example = User(id: "abcde12345", isActive: true, name: "Tom", age: 20, company: "Toms Car", email: "tom@tom.com", address: "tom street 123", about: "This is Tom", registered: "2015-11-10T01:47:18-00:00", tags: ["Candy", "Car"], friends: [Friend(id: "abcde11111", name: "Jack")])
}
