//
//  Bundle-Decodable.swift
//  SnowSeeker
//
//  Created by peterpetrov on 2022/10/18.
//

import Foundation

extension Bundle {
    /// locate `file` in bundle, try to read and decode it.
    /// if all succeeded, return it
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // try to read file content
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // try to decode the data
        // if succeeded, the type of `loaded` will be T(generic)
        guard let loaded = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
    }
}
