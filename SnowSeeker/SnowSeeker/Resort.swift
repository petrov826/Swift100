//
//  Resort.swift
//  SnowSeeker
//
//  Created by peterpetrov on 2022/10/18.
//

import Foundation

struct Resort: Codable, Identifiable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
    var facilityTypes: [Facility] {
        // [String] -> [Facility]
        facilities.map(Facility.init)
    }
    
    // these properties will be lazy loaded/computed
    static let allResort: [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResort[0]
}
