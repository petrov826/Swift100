//
//  BookwormApp.swift
//  Shared
//
//  Created by peterpetrov on 2022/05/22.
//

import SwiftUI

@main
struct BookwormApp: App {
    // source of truth
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
