//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/08.
//

import SwiftUI

enum Hand: String, CaseIterable {
    case Rock, Paper, Scissors
}

struct ContentView: View {
    @State private var showingNextRoundAlert = false
    @State private var showingGameDoneAlert = false
    @State private var toWin = true
    @State private var currentScore = 0
    @State private var currentRound = 1
    private let maxRound = 5
    @State private var gmHand = Hand.Rock
    
    var body: some View {
        VStack {
            Text("Brain Training Game!")
                .font(.largeTitle)
                .padding()
            Spacer()
            
            Text("Game Master's Hand")
                .font(.title)
            Image(gmHand.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            Spacer()

            Text("""
                 Choose your hand to \(toWin ? "WIN" : "LOSE") Game Master!
                 """)
                .font(.title)
            
            HStack {
                Button {
                    updateCurrentScore(playerHand: .Rock)
                    prepareForNextRound()
                } label: {
                    Image(Hand.Rock.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }
                
                Button {
                    updateCurrentScore(playerHand: .Paper)
                    prepareForNextRound()
                } label: {
                    Image(Hand.Paper.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }
                
                Button {
                    updateCurrentScore(playerHand: .Scissors)
                    prepareForNextRound()
                } label: {
                    Image(Hand.Scissors.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }
            }
            
            Spacer()
            
            VStack {
                Text("Your Score: \(currentScore)")
                Text("Current Round: \(currentRound)")
//                Text("\(maxRound - currentRound + 1) Rounds Left")
            }
            .font(.title)

            Spacer()
        }
        .alert("Your Result", isPresented: $showingGameDoneAlert) {
            Button("Restart", action: startNewGame)
        } message: {
            Text("You Got \(currentScore)")
        }
    }
    
    func prepareForNextRound() {
        if currentRound == maxRound {
            showingGameDoneAlert = true
        } else {
            gmHand = Hand.allCases.randomElement()!
            toWin.toggle()
            currentRound += 1
        }
    }
    
    func startNewGame() {
        currentScore = 0
        currentRound = 1
        showingNextRoundAlert = false
        showingGameDoneAlert = false
    }
    
    func isCorrectHand(toWin: Bool, gmHand: Hand, playerHand: Hand) -> Bool {
        switch playerHand {
        case .Rock:
            switch gmHand {
            case .Rock:
                return false
            case .Paper:
                return !toWin
            case .Scissors:
                return toWin
            }
        case .Paper:
            switch gmHand {
            case .Rock:
                return toWin
            case .Paper:
                return false
            case .Scissors:
                return !toWin
            }
        case .Scissors:
            switch gmHand {
            case .Rock:
                return !toWin
            case .Paper:
                return toWin
            case .Scissors:
                return false
            }
        }
    }
    
    func updateCurrentScore(playerHand: Hand) {
        if isCorrectHand(toWin: toWin, gmHand: gmHand, playerHand: playerHand) {
            currentScore += 1
        } else {
            currentScore -= 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
