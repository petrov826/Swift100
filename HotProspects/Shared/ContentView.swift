//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("example")
            .interpolation(.none) // remove blur
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
