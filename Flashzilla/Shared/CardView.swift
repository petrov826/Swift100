//
//  CardView.swift
//  Flashzilla
//
//  Created by peterpetrov on 2022/09/21.
//

import SwiftUI

struct CardView: View {
    let card: Card
    var removal: (() -> Void)? = nil
    
    @State private var showingAnswer = false
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .shadow(radius: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                Text(card.answer)
                    .font(.title)
                    .foregroundColor(.gray)
                    .opacity(showingAnswer ? 1.0 : 0.0)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    // user will drag the card left or right
                    if abs(offset.width) > 100 {
                        // attempt to call removal()
                        // if not set, just skip it
                        removal?()
                    } else {
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            showingAnswer.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
