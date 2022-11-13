//
//  Favorites.swift
//  SnowSeeker
//
//  Created by peterpetrov on 2022/11/09.
//

import Foundation

class Favorites: ObservableObject {
    private var resorts: Set<String>
    private var saveKey = "Favorites"
    
    init() {
        // load our saved data
        resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        self.resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        // write out our data
        
    }
}
