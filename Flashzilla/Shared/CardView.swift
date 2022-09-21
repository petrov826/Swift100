//
//  CardView.swift
//  Flashzilla
//
//  Created by peterpetrov on 2022/09/21.
//

import SwiftUI

struct CardView: View {
    let card: Card
    @State private var showingAnswer = false
    
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
