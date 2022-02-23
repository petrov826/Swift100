//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/02/22.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            Form {
                // ForEach is a view that
                // repeat view(s) inside closure for given range
                // so it will repeat Text() 5 times
                ForEach(0..<5) {
                    Text("Row \($0)")
                }
                
                // Picker is a view too
                Picker("select a student", selection: $selectedStudent) {
                    // loop over students. use value itself(string)
                    // to identify each view
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
