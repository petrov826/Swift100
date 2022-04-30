//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/04/19.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.width / 2, y: rect.maxY)) // bottom
        path.addLine(to: CGPoint(x: rect.width / 2, y: rect.minY)) // top
        
        path.addLine(to: CGPoint(x: rect.width / 4, y: rect.height / 4)) // left
        path.move(to: CGPoint(x: rect.width / 2, y: rect.minY)) // top
        
        path.addLine(to: CGPoint(x: rect.width * 3 / 4, y: rect.height / 4)) // right
        path.addLine(to: CGPoint(x: rect.width / 2, y: rect.minY)) // top

        return path
    }
}

struct ContentView: View {
    @State private var lineWidth = 10.0
    
    var body: some View {
        VStack {
            Arrow()
                .stroke(.green, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
            
            Slider(value: $lineWidth, in: 5...30)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
