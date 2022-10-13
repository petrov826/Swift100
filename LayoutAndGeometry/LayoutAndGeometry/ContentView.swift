//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by peterpetrov on 2022/10/11.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [
        .red, .blue, .green, .orange,
        .pink, .purple, .yellow
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    GeometryReader { geo in
                        Text("No. \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(
                                .degrees(-geo.frame(in: .global).minX) / 8,
                                axis: (x: 0, y: 1, z: 0)
                            )
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
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
