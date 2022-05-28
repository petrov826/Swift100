//
//  RatingView.swift
//  Bookworm
//
//  Created by peterpetrov on 2022/05/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maxRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }
            
            ForEach(1..<maxRating+1, id: \.self) {number in
                image(for: number)
                    .foregroundColor(rating < number ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        // when rating is 4, I want a view like "★★★★☆"
        // no-fill part
        if rating < number {
            return offImage ?? onImage
        // fill part
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
