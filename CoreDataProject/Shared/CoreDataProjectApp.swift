//
//  CoreDataProjectApp.swift
//  Shared
//
//  Created by peterpetrov on 2022/05/30.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    // source of truth
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
