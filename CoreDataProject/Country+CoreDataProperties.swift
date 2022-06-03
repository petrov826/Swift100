//
//  Country+CoreDataProperties.swift
//  CoreDataProject (iOS)
//
//  Created by peterpetrov on 2022/06/03.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var shortName: String?
    @NSManaged public var candy: NSSet?

    var wrappedFullName: String {
        fullName ?? "Unknown Country"
    }
    
    var wrappedShortName: String {
        shortName ?? "Unknown Country"
    }
    
    var candyArray: [Candy] {
        // as? : conditional type cast
        // if OK, the type of candy will be Set<Candy>
        // else, it will be nil
        let set = candy as? Set<Candy> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}

// MARK: Generated accessors for candy
extension Country {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Candy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Candy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}

extension Country : Identifiable {

}
