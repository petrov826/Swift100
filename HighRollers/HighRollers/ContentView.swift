//
//  ContentView.swift
//  HighRollers
//
//  Created by peterpetrov on 2022/10/13.
//

import SwiftUI

struct ContentView: View {
    @State private var diceNum = 3
    @State private var diceSides = 6
    @State private var rollResults = [Int]()
    
    var body: some View {
        VStack {
            Text("Roll Dice")
                .font(.largeTitle)
                .frame(width: 200, height: 100)
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .onTapGesture(perform: rollDices)
            Text("Result")
                .font(.largeTitle)
            // https://stackoverflow.com/a/57340694/10882227
            ForEach(rollResults.indices, id: \.self) { index in
                Text("\(rollResults[index])")
            }
        }
    }
        
    func rollDices() {
        rollResults = [Int](repeating: 1, count: diceNum)
        for i in 0..<rollResults.count {
            rollResults[i] = Int.random(in: 1..<diceSides+1)
        }
        print(rollResults)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
