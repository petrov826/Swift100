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
    @Published private(set) var people: [Prospect]
    
    let saveKey = "SavedData"
    
    init() {
        // on init, load data from UserDefaults
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
            }
        }
        
        // no data found...
        people = []
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggleIsContacted(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
}
