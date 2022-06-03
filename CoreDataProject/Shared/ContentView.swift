//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/05/30.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "S"
    
    var body: some View {
        VStack {
            Text("filter: \(lastNameFilter)")
            
            FilteredList(filter: lastNameFilter)
            
            Button("Add Examples") {
                let singer1 = Singer(context: moc)
                singer1.firstName = "Taylor"
                singer1.lastName = "Swift"
                
                let singer2 = Singer(context: moc)
                singer2.firstName = "Michael"
                singer2.lastName = "Jackson"
                
                try? moc.save()
            }
            
            Button("Show S") {
                lastNameFilter = "S"
            }
            
            Button("Show j") {
                lastNameFilter = "J"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
