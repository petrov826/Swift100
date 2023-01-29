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
                            Text(item.name)
                                .font(.footnote)
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            // .listStyle(.grouped)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
