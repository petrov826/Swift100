//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/30.
//

import SwiftUI

struct ContentView: View {
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                offset = .zero
                isDragging = false
            }
        
        let longPressGesture = LongPressGesture()
            .onEnded { _ in
                withAnimation {
                    isDragging = true
                }
            }
        
        // longPressGesture -> dragGesture
        // this will save us from misoperation(drag)
        let combinedGesture =
            longPressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.25 : 1.0)
            .offset(offset)
            .gesture(combinedGesture)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
