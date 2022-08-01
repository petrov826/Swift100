//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/20.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]() // history of user's answer
    @State private var rootWord = "" // question
    @State private var newWord = "" // user's answer
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var currentScore = 0
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter Your Word", text: $newWord)
                        .autocapitalization(.none)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                        .accessibilityElement() // .ignore by default
                        .accessibilityLabel("\(word), \(word.count) letters")
                    }
                }
                
                Text("Your Score: \(currentScore)")
                    .font(.title)
            }
            .navigationTitle(rootWord)
            .onSubmit { // when user typed return key...
                addNewWord() // call this function
            }
            .onAppear { // similar to Unity's OnStart()
                startGame()
            }
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
            .toolbar {
                Button("New Game") {
                    startGame()
                }
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count >= 3 else {
            wordError(title: "Too Short Answer", message: "Use more than 3 letters")
            return
        }
        
        guard answer != rootWord else {
            wordError(title: "Invaild Answer", message: "Your answer is rootWord")
            return
        }
    
        guard isOriginal(word: answer) else {
            wordError(title: "Word Already Used", message: "You can't use '\(answer)' twice")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word Not Possible", message: "You can't spell '\(answer)' from '\(rootWord)'")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word Not Recognized", message: "No such word")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
            updateCurrentScore()
        }
        newWord = ""
    }
    
    func updateCurrentScore() {
        let wordLength = rootWord.count
        let wordCount = usedWords.count
        
        currentScore += wordLength + wordCount * 2
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                usedWords = [String]()
                currentScore = 0
                return
            }
        }
        fatalError("Couldn't load start.txt from bundle")
    }
    
    func isOriginal(word: String) -> Bool {
        // check if the word isn't used yet
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        // let's say rootWord is "passion"
        // when user's input is "pass" or "son" -> correct
        // when user's input is "pat" or "song" -> wrong
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        // check if the word is really exsists
        let chceker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = chceker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
