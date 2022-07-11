//
//  Result.swift
//  BucketList
//
//  Created by peterpetrov on 2022/07/06.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    // dict which maps Int(wikipedia internal ID) to Page
    let pages: [Int: Page]
}

struct Page: Codable, Comparable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    var description: String {
        // all of below can be nil. time to use nil coalescings
        // terms, terms["description"], terms["description"].first
        terms?["description"]?.first ?? "No further information"
    }
    
    static func <(lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
}
