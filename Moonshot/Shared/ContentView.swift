//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/04/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            Image("SwiftUI_course")
                .resizable()
                .aspectRatio(contentMode: .fit)
                // frame height will be inferred
                // by contentMode: .fit and frame width
                .frame(
                    width: geo.size.width * 0.8
                )
                // move the image to the center of the screen
                .frame(
                    width: geo.size.width,
                    height: geo.size.height
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
