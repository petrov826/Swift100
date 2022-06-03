//
//  Candy+CoreDataProperties.swift
//  CoreDataProject (iOS)
//
//  Created by peterpetrov on 2022/06/03.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    var wrappedName: String {
        name ?? "Unknown Candy"
    }
}

extension Candy : Identifiable {

}
