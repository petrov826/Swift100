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
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            // try to decode `data`. if failed, return nil
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                resorts = decoded
                return
            } else {
                fatalError("Failed to decode `favorite resorts` from UserDefaults")
            }
        } else {
            // if not found in UserDefault, set it an empty Set
            resorts = []
        }
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
        if let encoded = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        } else {
            fatalError("Failed to encode and save favorite resorts to UserDefaults.")
        }
    }
}
