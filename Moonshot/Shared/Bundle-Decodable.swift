//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by peterpetrov on 2022/04/14.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [String: Astronaut] {
        // get url by filename from Bundle
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file)")
        }
        
        // try to load data from the url
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from Bundle")
        }
        
        // try to decode the data
        guard let decoded = try? JSONDecoder().decode([String: Astronaut].self, from: data) else {
            fatalError("Failed to decode \(file)")
        }
        
        return decoded
    }
}
