//
//  Order.swift
//  CupcakeCorner
//
//  Created by peterpetrov on 2022/05/05.
//

import SwiftUI

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        // when user changed minds to disable special request,
        // the values of extraFrosting and addSprinkles don't change.
        // this might cause a future bug, so set them back to false by hand
        didSet {
            if !specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    // address info
    @Published var name = ""
    @Published var street = ""
    @Published var city = ""
    @Published var zipcode = ""
    
    var hasValidAddress: Bool {
        // return false if one of these values is empty
        if name.isEmpty || street.isEmpty || city.isEmpty || zipcode.isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        // $2 / cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += Double(type) / 2
        
        // $1 / cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.5 / cake for extra sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
