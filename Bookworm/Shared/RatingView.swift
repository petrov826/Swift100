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
                    // option 1
                    // .accessibilityLabel(rating == 1 ? "1 star" : "\(rating) stars")
                    // .accessibilityRemoveTraits(.isImage)
                    // .accessibilityAddTraits(rating < number ? .isButton : [.isButton, .isSelected])
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Rating")
            .accessibilityValue(rating == 1 ? "1 star" : "\(rating) stars")
            .accessibilityAdjustableAction { direction in
                switch direction {
                case .increment:
                    if rating < maxRating { rating += 1 }
                case .decrement:
                    if 1 < rating { rating -= 1 }
                default: break
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
