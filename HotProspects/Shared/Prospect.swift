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
    // isContacted can be updated only in this file
    // this is the reason Prospects class is in this file
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    // @Publish only monitors # of people
    // property changes doesn't re-invoke subscriber's view
    @Published var people: [Prospect]
    
    init() {
        people = []
    }
    
    func toggleIsContacted(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}
