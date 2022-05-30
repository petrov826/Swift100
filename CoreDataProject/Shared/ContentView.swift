//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/05/30.
//

import SwiftUI

struct Student: Hashable {
    let name: String // String conforms to Hashable by default
}

struct ContentView: View {
    let students = [
        Student(name: "Harry Potter"),
        Student(name: "Hermione Granger")
    ]
    
    var body: some View {
        List {
            // so... what is "id: \.self" doing?
            // for each element -> hash value
            // and use them to identity each view
            ForEach([2, 4, 6, 8, 10], id: \.self) {
                Text("\($0) is even")
            }
            
            Divider()
            
            ForEach(students, id: \.self) { student in
                Text(student.name)
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
