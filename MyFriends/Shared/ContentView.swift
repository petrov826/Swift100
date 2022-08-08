//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/07.
//

import SwiftUI

struct ContentView: View {
    @State private var friends = [Friend]()
    @State private var image: Image?
    @State private var uiImage: UIImage?
    @State private var showingImagePicker = false
    @State private var showingForm = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.gray)
            
            Text("Tap to select a photo of your friend")
                .foregroundColor(.white)
                .font(.headline)
            
            image?
                .resizable()
                .scaledToFit()
        }
        // when user tapped the rectangle,
        // 1. show ImagePicker
        .onTapGesture {
            showingImagePicker = true
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $uiImage)
        }
        // 2. when user selected an image,
        // call loadImage()
        .onChange(of: uiImage) { _ in
            loadImage()
            showingForm = true
            let newFriend = Friend(name: "", description: "")
            friends.append(newFriend)
        }
        .sheet(isPresented: $showingForm) {
            FriendInfoForm(friend: $friends[-1])
        }
    }
    
    func loadImage() {
        // turn UIImage? to UIImage
        guard let uiImage = uiImage else { return }
        // create Image from UIImage
        image = Image(uiImage: uiImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
