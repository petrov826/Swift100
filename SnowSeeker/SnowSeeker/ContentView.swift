//
//  ContentView.swift
//  SnowSeeker
//
//  Created by peterpetrov on 2022/10/17.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        // .phone, .pad, .mac, .tv and .carplay are avaiable
        if UIDevice.current.userInterfaceIdiom == .phone {
            // the type of self is View
            // .stack only shows a single top view at a time
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            // primary view
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                         .frame(width: 40, height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        // black edge around the flag
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(
                                    .black.opacity(0.5),
                                    lineWidth: 1
                                )
                        }
                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Ski Resorts")
            // make List searchable
            .searchable(text: $searchText, prompt: "Search for a resort")
            .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
            
            // secondary view
            // if the screen is big and it's landscape mode,
            // blank screen will be displayed.
            // So let's display a static view
            // to show user how to use this app
            WelcomeView()
        }
        .phoneOnlyNavigationView()
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return resorts
        } else {
            return resorts.filter { resort in
                resort.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
