//
//  iDineApp.swift
//  iDine
//
//  Created by peterpetrov on 2023/01/15.
//

import SwiftUI

@main
struct iDineApp: App {
    // with @StateObject, Order class
    // must conform to ObservableObject protocol
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
