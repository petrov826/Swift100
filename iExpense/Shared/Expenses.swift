//
//  Expenses.swift
//  iExpense (iOS)
//
//  Created by peterpetrov on 2022/04/05.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        // items got updated, save it to UserDefaults
        didSet {
            // try to encode items
            if let encoded = try? JSONEncoder().encode(items) {
                // then save it to UserDefaults as json
                UserDefaults.standard.set(encoded, forKey: "Item")
            }
        }
    }
    
    init() {
        // get json from UserDefaults
        if let savedItem = UserDefaults.standard.data(forKey: "Item") {
            // then try to decode it
            // tell JSONDecoder that the type of encoded item is Array[ExpenseItem]
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItem) {
                items = decodedItems
                return
            }
        }
            
        items = [] // empty array
    }
}
