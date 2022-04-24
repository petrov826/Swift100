//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/04/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // original Paul
            Image("PaulHudson")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)

            // redish Paul
            ZStack {
                Image("PaulHudson")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Rectangle()
                    .fill(.red)
                    .blendMode(.multiply)
            }
            .frame(width: 200, height: 200)
            
            // simpler syntax with colorMultiply
            Image("PaulHudson")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .colorMultiply(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
