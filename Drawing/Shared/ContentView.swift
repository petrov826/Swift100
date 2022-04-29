//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/04/19.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: Double
    
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // clockwise
        path.move(to: CGPoint(x: 0, y: rect.maxY)) // bottom left
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY)) // top left
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY)) // top right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // bottom right
        path.addLine(to: CGPoint(x: 0, y: rect.maxY)) // bottom left
        
        return path
    }
}

struct ContentView: View {
    @State private var amount = 5.0
    
    var body: some View {
        Trapezoid(insetAmount: amount)
            .frame(width: 200, height: 200)
            .onTapGesture {
                withAnimation {
                    amount = Double.random(in: 10...90)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
