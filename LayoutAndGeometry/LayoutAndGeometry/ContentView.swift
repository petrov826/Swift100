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
        GeometryReader { fullViewGeo in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % colors.count])
                            .rotation3DEffect(
                                // min(top) Y of Text view in global space
                                // bigger minY, more rotation
                                // fullViewGeo.size.height / 2 = half height of the screen
                                .degrees(geo.frame(in: .global).minY - fullViewGeo.size.height / 2) / 8,
                                axis: (x: 0, y: 1, z: 0)
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
