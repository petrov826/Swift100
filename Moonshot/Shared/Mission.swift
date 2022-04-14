//
//  Mission.swift
//  Moonshot
//
//  Created by peterpetrov on 2022/04/14.
//

import Foundation

struct Mission: Codable, Identifiable {
    // nested struch
    // Crew struct lives inside of Mission struct
    struct Crew: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchData: String?
    let crew: [Crew]
    let description: String
}
