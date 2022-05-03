//
//  Habit.swift
//  HabitTracker
//
//  Created by peterpetrov on 2022/05/02.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id = UUID()
    let title: String
    let description: String
    var count: Int = 0
}
