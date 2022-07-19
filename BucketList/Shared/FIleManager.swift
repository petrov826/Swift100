//
//  FIleManager.swift
//  BucketList
//
//  Created by peterpetrov on 2022/07/11.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
