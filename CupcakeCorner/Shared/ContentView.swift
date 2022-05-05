//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/05/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
                // there's no condition in the content,
                // "image" will be type of Image
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                // Color.red
                ProgressView() // display spiner while downloading
            }
            .frame(width: 200, height: 200)
            
            AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
                // if the content of closure has condition,
                // "phase" will be type of AsyncImagePhase not Image
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else if phase.error != nil {
                    Text("There was an error loading the image")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
