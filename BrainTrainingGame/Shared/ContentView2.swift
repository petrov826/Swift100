//
//  ContentView2.swift
//  BrainTrainingGame
//
//  Created by peterpetrov on 2022/03/14.
//

import SwiftUI

struct ContentView2: View {
    private var hands = ["✊", "✋", "✌️"]
    @State private var gmHand = "✊"
    @State private var shouldWin = true
    
    @State private var currentScore = 0
    @State private var currentRound = 0
    
    private var maxRound = 5
    
    @State private var showingResult = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Game Master's Hand")
                .font(.title)
            Text(gmHand)
                .font(.system(size: 100))
            
            Spacer()
            
            Text("Choose your hand to \(shouldWin ? "WIN" : "LOSE")")
                .font(.title)
            
            HStack {
                ForEach(hands, id: \.self) { hand in
                    Button {
                        onChooseHand(hand)
                    } label: {
                        Text(hand)
                            .font(.system(size: 100))
                    }
                }
            }
            
            Spacer()
            
            Text("Your Score: \(currentScore)")
                .font(.title)
        }
        .alert("Result", isPresented: $showingResult) {
            Button("New Game", action: startNewGame)
        } message: {
            Text("Your Score: \(currentScore)")
        }
    }
    
    func onChooseHand(_ hand: String) {
        if isCorrectChoice(playerHand: hand, gmHand: gmHand, shouldWin: shouldWin) {
            currentScore += 1
        } else {
            currentScore -= 1
        }
        onRoundEnd()
    }
    
    func onRoundEnd() {
        currentRound += 1
        gmHand = hands[Int.random(in: 0...2)]
        shouldWin.toggle()
        if currentRound == maxRound {
            showingResult = true
        }
    }
    
    func startNewGame() {
        currentScore = 0
        currentRound = 0
        showingResult = false
        gmHand = hands[Int.random(in: 0...2)]
    }
    
    func isCorrectChoice(playerHand: String, gmHand: String, shouldWin: Bool) -> Bool {
        switch playerHand {
        case "✊":
            switch gmHand {
            case "✊":
                return false
            case "✋":
                return !shouldWin
            case "✌️":
                return shouldWin
            default:
                return false
            }
        case "✋":
            switch gmHand {
            case "✊":
                return shouldWin
            case "✋":
                return false
            case "✌️":
                return !shouldWin
            default:
                return false
            }
        case "✌️":
            switch gmHand {
            case "✊":
                return !shouldWin
            case "✋":
                return shouldWin
            case "✌️":
                return false
            default:
                return false
            }
        default:
            return false
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
