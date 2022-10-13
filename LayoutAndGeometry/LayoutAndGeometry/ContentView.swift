//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by peterpetrov on 2022/10/11.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(
                                Color(
                                    hue: geo.frame(in: .global).midY / fullView.size.height,
                                    saturation: 1.0,
                                    brightness: 1.0
                                )
                            )
                            .rotation3DEffect(
                                .degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5,
                                axis: (x: 0, y: 1, z: 0)
                            )
                            .opacity(
                                geo.frame(in: .global).midY / 200
                            )
                            .scaleEffect(
                                max(
                                    geo.frame(in: .global).midY / fullView.size.height * 1.5,
                                    0.5
                                )
                            )
                    }
                    .frame(height: 40)
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
