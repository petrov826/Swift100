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

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
