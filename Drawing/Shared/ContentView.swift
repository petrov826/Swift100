//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/04/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // drawing a triangle
        Path { path in
            // note: CG stands for Core Graphics
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.closeSubpath()
        }
        // .fill(.blue) // blue triangle
        // .stroke(.blue, lineWidth: 10) // blue stroke
        .stroke(
            .blue,
            style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
