//
//  ContentView.swift
//  SnowSeeker
//
//  Created by peterpetrov on 2022/10/17.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        // Group doesn't contain layout inforamtion
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .background(.green.opacity(0.2))
        .font(.title)
    }
}

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizotalSizeClass
    
    var body: some View {
        // if screen width is not wide enough,
        // stack vertically
        if horizotalSizeClass == .compact {
            VStack {
                UserView()
            }
        // for iPhone13 Pro Max and iPad
        } else {
            HStack {
                UserView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
