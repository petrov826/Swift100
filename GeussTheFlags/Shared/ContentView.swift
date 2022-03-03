//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/03.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        // This's just a showcase.
        // Let's forget about design for now
        
        // VStack, HStack and ZStack
        VStack {
            // HStack that lives in VStack
            HStack {
                Text("1")
                Text("2")
                Text("3")
            }
            HStack {
                Text("4")
                Text("5")
                Text("6")
            }
            
            // ZStack and Color
            ZStack {
                Color.green
                Text("Hello!")
            }
            .frame(width: 200, height: 50)
            
            // translucent background
            ZStack {
                VStack(spacing: 0.0) {
                    Color.red
                    Color.blue
                }
                .frame(height: 100)
                
                Text("translucent background")
                    .foregroundColor(.secondary)
                    .padding(25)
                    .background(.ultraThinMaterial)
            }
            
            // Gradient families!!!
            LinearGradient(gradient: Gradient(colors: [.yellow, .blue]), startPoint: .top, endPoint: .bottom)
                .frame(height: 100)
            
            RadialGradient(gradient: Gradient(colors: [.red, .blue]), center: .center, startRadius: 10, endRadius: 50)
                .frame(height: 100)
            
            AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]), center: .center)
                .frame(height: 100)
            
            // buttons with custom color
            HStack {
                Button("b1") { }
                    .buttonStyle(.bordered)
                
                // button for some destructive actions
                Button("b2", role: .destructive) { }
                    .buttonStyle(.bordered)
                
                Button("b3") { }
                    .buttonStyle(.borderedProminent)
                
                Button("b4") { }
                    .buttonStyle(.borderedProminent)
                    // change blue tint color to mint
                    .tint(.mint)
                
                Button("b5", role: .destructive) { }
                    .buttonStyle(.borderedProminent)
                
               
            }
            
            // custom design buttons
            HStack(spacing: 20.0) {
                Button {
                   print("Yes, you tapped me.")
                } label: {
                   Text("TAP ME!")
                       .padding()
                       .foregroundColor(.red)
                       .background(.blue)
                }
                Button {
                    print("It's time to edit")
                } label: {
                    Label("Edit", systemImage: "pencil")
                }
            }
            
            // showing alert
            Button("Show Alert") {
                showingAlert = true
            }
            // two-way binding. when a button got tappped,
            // this modifier will change(write back)
            // the binded state to false
            .alert("Important message title here", isPresented: $showingAlert) {
                Button("Delete", role: .destructive) { }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Please read this message carefully")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
