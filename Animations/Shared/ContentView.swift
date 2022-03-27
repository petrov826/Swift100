//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/23.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    // for snake effect
    let letters = Array("Hello SwiftUI!")
    @State private var enabled2 = false
    @State private var dragAmount2 = CGSize.zero
    
    @State private var showingRedRectangle = false
    @State private var showingRedRectangle2 = false
    
    var body: some View {
        VStack(spacing: 50) {
            Button("Tap Me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 100)
            .foregroundColor(.white)
            .background(enabled ? .blue : .gray)
            // the order matters!
            // if we put clipShape after animation, clipShape doesn't animate
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 30 : 0))
            .animation(.default, value: enabled)
            
            LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        // no need for wrapping with withAnimation
                        // by default, onChanged animates smoothly
                        .onChanged { dragAmount = $0.translation }
                        .onEnded { _ in
                            withAnimation {
                                dragAmount = .zero
                            }
                        }
                )
            
            // snake effect. looks awesome!
            HStack(spacing: 0) {
                ForEach(0..<letters.count) { i in
                    Text(String(letters[i]))
                        .padding(5)
                        .font(.title)
                        .background(enabled2 ? .green : .red)
                        .offset(dragAmount2)
                        .animation(
                            .default.delay(Double(i) / 20),
                            value: dragAmount2
                        )
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { dragAmount2 = $0.translation }
                    .onEnded { _ in
                        dragAmount2 = .zero
                        enabled2.toggle()
                    }
            )
            
            VStack {
                Button("Show/Hide Red Rectangle") {
                    withAnimation {
                        showingRedRectangle.toggle()
                    }
                }
                if showingRedRectangle {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 100)
                        // transition didn't work well in Preview window...
                        // appear with scaling up,
                        // disappear with scaling down
                        // .transition(.scale)
                    
                        // appear with scaling up,
                        // disappear with fading out
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
            }
            
            ZStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 200, height: 200)
                
                if showingRedRectangle2 {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                        .transition(.pivot)
                }
            }
            .onTapGesture {
                withAnimation {
                    showingRedRectangle2.toggle()
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
