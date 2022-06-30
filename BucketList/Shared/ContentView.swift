//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/06/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello")
            .onTapGesture {
                let message = "Test Message"
                let url = getDocumentDirectory().appendingPathComponent("message.txt")
                
                do {
                    // try to write to the URL
                    try message.write(to: url, atomically: true, encoding: .utf8)
                    
                    // try to read it back
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
    
    /// get available Document URLs and return the 1st one
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
