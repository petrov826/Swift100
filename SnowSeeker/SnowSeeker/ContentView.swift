//
//  ContentView.swift
//  SnowSeeker
//
//  Created by peterpetrov on 2022/10/17.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    let allNames = ["Tom", "Jack", "Sam", "Mary"]
    
    var body: some View {
        NavigationView {
            List(filteredName, id: \.self) { name in
                Text(name)
            }
            // when searchText changed,
            // body will be reinvoked
            .searchable(
                text: $searchText,
                prompt: "Look for something"
            )
            .navigationTitle("Searching")
        }
    }
    
    var filteredName: [String] {
        if searchText.isEmpty {
            return allNames
        } else {
            return allNames.filter {
                $0.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
