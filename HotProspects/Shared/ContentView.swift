//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/08.
//

import SwiftUI


struct ContentView: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        // when `selection` changed,
        // automatically switch tab which selectedTag is tag
        TabView(selection: $selectedTab) {
            Text("tab1") // this will shown in center
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    // this will shown in bottom
                    Label("one", systemImage: "star")
                }
                .tag("One")
            
            Text("tab2")
                .tabItem {
                    Label("two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
