//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/30.
//

import SwiftUI

struct ContentView: View {
    // hold current gesture' angle
    @State private var currentAngle = Angle.zero
    // after gesture ended
    @State private var finalAngle = Angle.zero
    
    var body: some View {
        Text("Hello, world!")
            .rotationEffect(currentAngle + finalAngle)
            .gesture(
                RotationGesture()
                    .onChanged { angle in
                        currentAngle = angle
                    }
                    .onEnded { angle in
                        finalAngle += currentAngle
                        currentAngle = .zero
                    }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
