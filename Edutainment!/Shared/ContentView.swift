//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/29.
//

import SwiftUI

enum GameState {
case prepare, playing
}

struct ContentView: View {

    let questionNumSelect = [5, 10, 15]
    
    // game state
    @State private var gameState = GameState.prepare
    
    // alerts
    @State private var showingResult = false
    
    // user preference
    @State private var numToPractice = 7
    @State private var questionNum = 5
    
    // question and answer
    let aRange = 1...9
    let bRange = 1...9
    @State private var pickedA = 1
    @State private var pickedB = 1
    @State private var userAnswer = 1
    
    // user score
    @State private var currentScore = 0
    
    var body: some View {
        NavigationView {
            VStack {
                if gameState == .prepare {
                    Form {
                        Section("Number To Practice") {
                            Stepper("\(numToPractice)", value: $numToPractice, in: 2...12)
                        }
                        
                        Section("How Many Questions?") {
                            Picker("How Many Questions?", selection: $questionNum) {
                                ForEach(questionNumSelect, id: \.self) { i in
                                    Text("\(i)")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                    }
                    .toolbar {
                        Button("Start") {
                            withAnimation {
                                gameState = .playing
                            }
                            startNewGame()
                        }
                    }
                }
                else if gameState == .playing {
                    Form {
                        Section {
                            TextField("Type Answer", value: $userAnswer, format: .number)
                                .keyboardType(.decimalPad)
                                .onSubmit {
                                    checkAnswer()
                                    prepareNewQuestion()
                                }
                        } header: {
                            Text("\(pickedA) * \(pickedB) = ?")
                                .font(.title)
                        }
                        
                        Text("Current Score: \(currentScore)")
                        Text("Questions Left: \(questionNum)")
                    }
                    .onAppear {
                        startNewGame()
                    }
                    .toolbar {
                        Button("Quit") {
                            withAnimation {
                                gameState = .prepare
                            }
                        }
                    }
                    .alert("Completed!", isPresented: $showingResult) {
                        Button("Restart") { startNewGame() }
                        Button("Quit") { gameState = .prepare }
                    } 
                }
            }
            .navigationTitle("Edutainment!")
        }
    }
    
    func startNewGame() {
        gameState = .playing
        showingResult = false
        currentScore = 0
        prepareNewQuestion()
    }
    
    func prepareNewQuestion() {
        if questionNum == 0 {
            showingResult = true
        }
        pickedA = aRange.randomElement() ?? 5
        pickedB = bRange.randomElement() ?? 5
        
        userAnswer = 0
    }
    
    func checkAnswer() {
        if pickedA * pickedB == userAnswer {
            currentScore += 1
        }
        questionNum -= 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
