//
//  ContentView.swift
//  SnowSeeker
//
//  Created by peterpetrov on 2022/10/17.
//

import SwiftUI

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    var body: some View {
        NavigationView {
            // primary view
            List(resorts) { resort in
                NavigationLink {
                    Text(resort.name)
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
            
            // secondary view
            // if the screen is big and it's landscape mode,
            // blank screen will be displayed.
            // let's display a static view
            // to show user how to use this app
            WelcomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
