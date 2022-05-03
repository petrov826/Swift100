//
//  HabitList.swift
//  HabitTracker
//
//  Created by peterpetrov on 2022/05/02.
//

import Foundation

class HabitList: ObservableObject {
    @Published var items = [Habit]() {
        // on add new habit
        didSet {
            // try to encode it
            if let encoded = try? JSONEncoder().encode(items) {
                // save all habits to UserDefaults
                UserDefaults.standard.set(encoded, forKey: "habits")
            }
        }
    }
    
    init() {
        // get json from UserDefaults
        if let savedItems = UserDefaults.standard.data(forKey: "habits") {
            // try to decode it
            if let decoded = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                // if successed, set it to items
                items = decoded
                return
            }
        }
        
        // otherwise, items should be empty array
        items = []
    }
}
