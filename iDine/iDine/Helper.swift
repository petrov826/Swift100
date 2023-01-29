//
//  Helper.swift
//  A small collection of quick helpers to avoid repeating the same old code.
//
//  Created by Paul Hudson on 23/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        // locate `file`
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        // try to load file content from `url`
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // try to decode `data`
        guard let loaded = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
