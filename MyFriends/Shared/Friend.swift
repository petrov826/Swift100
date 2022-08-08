//
//  Friend.swift
//  MyFriends
//
//  Created by peterpetrov on 2022/08/07.
//

import Foundation
import SwiftUI

struct Friend: Identifiable, Comparable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String {
        "\(name)_image"
    }
    
    static func <(lhs: Self, rhs: Self) -> Bool {
        lhs.name < rhs.name
    }
    
    static let example = Friend(name: "Tom", description: "Swift developer")
}
