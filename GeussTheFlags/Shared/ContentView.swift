//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/03.
//

import SwiftUI

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
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: ???")
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
            Text("Your score is ???")
        }
    }
    
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
