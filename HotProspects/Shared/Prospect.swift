//
//  Prospect.swift
//  HotProspects
//
//  Created by peterpetrov on 2022/08/14.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Unknown"
    var emailAddress = ""
    var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        people = []
    }
}
