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

enum SortMode: String, CaseIterable {
    case none, alphabetical, country
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @StateObject private var favorites = Favorites()
    @State private var searchText = ""
    @State private var sortMode = SortMode.none
    
    var body: some View {
        NavigationView {
            // primary view
            VStack {
                HStack {
                    Text("Sort Mode")
                    Picker("Sort Mode", selection: $sortMode) {
                        ForEach(SortMode.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding(.horizontal)
                
                List(sortedFilteredResorts) { resort in
                    NavigationLink {
                        ResortView(resort: resort)
                    } label: {
                        HStack {
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
                            
                            if favorites.contains(resort) {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibilityLabel("This is a favorite resort")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                .navigationTitle("Ski Resorts")
                // make List searchable
                .searchable(text: $searchText, prompt: "Search for a resort")
            .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
            }
            
            // secondary view
            // if the screen is big and it's landscape mode,
            // blank screen will be displayed.
            // So let's display a static view
            // to show user how to use this app
            WelcomeView()
        }
        .phoneOnlyNavigationView()
        // all child view can acccess to `favorites`
        .environmentObject(favorites)
    }
    
    var sortedResorts: [Resort] {
        switch sortMode {
        case .none:
            return resorts
        case .alphabetical:
            return resorts.sorted {
                $0.name < $1.name
            }
        case .country:
            return resorts.sorted {
                $0.country < $1.country
            }
        }
    }
    
    var sortedFilteredResorts: [Resort] {
        if searchText.isEmpty {
            return sortedResorts
        } else {
            return sortedResorts.filter { resort in
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
