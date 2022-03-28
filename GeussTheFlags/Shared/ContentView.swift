//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/03.
//

import SwiftUI

struct FlagImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = [
        "Estonia", "France", "Germany",
        "Ireland", "Italy", "Nigeria",
        "Poland", "Russia", "Spain",
        "UK", "US"
    ].shuffled()
    
    // this app will show 3 flags
    // (= first 3 elements of countries) at once.
    // pick a correctAnswer from 3 countries
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var currentScore = 0
    @State private var currentQuestionCount = 0
    let maxQuestionCount = 3
    
    @State private var showingRestartScreen = false
    
    @State private var rotateDegree = 0.0
    @State private var flagOpacity = 1.0
    @State private var flagScale = 1.0
    @State private var tappedFlagNum = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.headline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            // On tapped, call this function
                            tappedFlagNum = number
                            withAnimation {
                                rotateDegree += 360
                                flagOpacity = 0.25
                                flagScale = 0.75
                            }
                            flagTapped(number)
                        } label: {
                            // Image(countries[number])
                            //     .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            //     .shadow(radius: 5)
                            FlagImage(imageName: countries[number])
                                .rotation3DEffect(
                                    .degrees(tappedFlagNum == number ? rotateDegree : 0),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .opacity(tappedFlagNum != number ? flagOpacity : 1)
                                .scaleEffect(tappedFlagNum != number ? flagScale : 1)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(currentScore)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                Text("\(maxQuestionCount - currentQuestionCount) questions left")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            // player can try another question by tapping Continue button
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(currentScore)")
        }
        .alert("Finished", isPresented: $showingRestartScreen) {
            Button("Restart", action: restartGame)
        } message: {
            Text("Your final score is \(currentScore).\nYou can try again!")
        }
    }
    
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            currentScore += 1
        } else {
            scoreTitle = "Wrong!\nThat's the flag of \(countries[number])"
        }
        showingScore = true
        currentQuestionCount += 1
        if currentQuestionCount >= maxQuestionCount {
            showingRestartScreen = true
            showingScore = false
        }
    }
    
    func askQuestion() {
        guard currentQuestionCount != maxQuestionCount else {
            return
        }
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
        
        // quick fix
        flagOpacity = 1.0
        flagScale = 1.0
    }
    
    func restartGame() {
        currentScore = 0
        currentQuestionCount = 0
        showingRestartScreen = false
        showingScore = false
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
