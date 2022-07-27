//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/07/26.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPictureIndex = 0
    
    var body: some View {
        Image(pictures[selectedPictureIndex])
            .resizable()
            .scaledToFit()
            .onTapGesture(perform: changeIndex)
            // read label not image name
            .accessibilityLabel(labels[selectedPictureIndex])
            // this image is a button not an image
            // "Tulpips button" is better than "Tulips image"
            .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
    }
    
    func changeIndex() {
        selectedPictureIndex = Int.random(in: 0..<self.pictures.count)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
