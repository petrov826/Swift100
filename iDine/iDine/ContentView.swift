//
//  ContentView.swift
//  iDine
//
//  Created by peterpetrov on 2023/01/15.
//

import SwiftUI

struct ContentView: View {
    let menuSections = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menuSections) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
//                            NavigationLink {
//                                // destination
//                                // With this approach, Swift will make
//                                // all ItemDetail views at once.
//                                // Since it's not efficient,
//                                // let's use .navigationDestination
//                                ItemDetail(item: item)
//                            } label: {
//                                ItemRow(item: item)
//                            }
                            NavigationLink(value: item) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            // pass type and destination
            .navigationDestination(for: MenuItem.self) { item in
                ItemDetail(item: item)
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
