//
//  Card.swift
//  Flashzilla
//
//  Created by peterpetrov on 2022/09/21.
//

import Foundation

struct Card: Codable, Identifiable {
    var id = UUID()
    let prompt: String
    let answer: String
    
    static let example = Card(
        prompt: "Who played the 13th doctor in Doctor Who?",
        answer: "Jodie Whittaker"
    )
}
