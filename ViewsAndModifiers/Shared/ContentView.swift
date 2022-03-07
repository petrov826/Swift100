//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/06.
//

import SwiftUI

// define a new View
// we can use this view everywhere like Text() or Image()
// and there's no code duplication!
struct RoundedText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


// creating custom ViewModifier
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// and add it to View protocol to make it easy to use
extension View {
    // add new computed property to View protocol
    // Text().titleStyle() == Text().modifier(Title())
    func titleStyle() -> some View {
        modifier(Title())
    }
}


// another custom modifier!
struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}


// day 24
// create another custom modifier
struct LargeBlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(6)
            .font(.largeTitle)
            .foregroundColor(.blue)
            .background(.black)
    }
}

extension View {
    func largeBlueTitle() -> some View {
        modifier(LargeBlueTitle())
    }
}


struct ContentView: View {
    @State private var useRedText = false
    
    // views as properties
    // making body property shorter and cleaner
    let text1 = Text("Hello!")
    let text2 = Text("Bye!")
    
    // views as computed properties
    var text3: some View {
        Text("It's a nice day!")
    }
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text("Hello, world!")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
            
            Button("Hello everyone!") {
                useRedText.toggle()
            }
            .foregroundColor(useRedText ? .red : .blue)
            
            VStack {
                Text("Spring")
                Text("Summer")
                // child modifier overrides parent modifier
                // so this view will get bigger
                Text("Autumn")
                    .font(.largeTitle)
                Text("Winter")
            }
            .font(.title) // environment modifier
            
            text1
                .foregroundColor(.red)
            text2
                .foregroundColor(.blue)
            text3
                .foregroundColor(.green)
            
            HStack {
                RoundedText(text: "first")
                    .foregroundColor(.red)
                RoundedText(text: "second")
                                .foregroundColor(.yellow)
            }
            
            HStack {
                Text("text1")
                Text("text2")
                    .modifier(Title())
                Text("text3")
                    .titleStyle()
            }
            
            Color.green
                .frame(width: 300, height: 50)
                .watermarked(with: "Hacking with Swift")
            
            Text("Awesome!!")
                .largeBlueTitle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
