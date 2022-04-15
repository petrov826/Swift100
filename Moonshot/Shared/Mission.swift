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
    let launchDate: Date? // String?
    let crew: [Crew]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var imageName: String {
        // apollo11
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
