//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/05/30.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                // without wizard.append(wizard) or something,
                // new wizard will be append to the wizards
                // by saying Wizard(context: moc)
                let wizard = Wizard(context: moc)
                // without this line, the empty item will be added
                // ("Unknown" will be displayed)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
