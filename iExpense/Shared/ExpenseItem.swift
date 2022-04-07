//
//  ExpenseItem.swift
//  iExpense (iOS)
//
//  Created by peterpetrov on 2022/04/05.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    // UU stands for Universally Unique
    // to conform Codable protocol,
    // id has to be variable not constant
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
