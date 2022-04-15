//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by peterpetrov on 2022/04/14.
//

import Foundation

extension Bundle {
    // func decode(_ file: String) -> [String: Astronaut] {
    // only works with [String: Astronaut] type(doesn't work with Mission type...)
    // now we want to use this method to decode missions.json too
    // so let's make this Generic
    // T can be [String: Astronaut] or Mission
    //
    // Swift will give us an error message saying...
    // Instance method 'decode(_:from:)' requires that 'T' conform to 'Decodable'
    // because T can be NOT decodable type
    // we can fix it by changing <T> to <T: Codable>. Awesome!!
    func decode<T: Codable>(_ file: String) -> T {
        // get url by filename from Bundle
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file)")
        }
        
        // try to load data from the url
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from Bundle")
        }
        
        let decoder = JSONDecoder()
        // tell Swift how to decode dates by dateFormat
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        // try to decode the data
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file)")
        }
        
        return decoded
    }
}
