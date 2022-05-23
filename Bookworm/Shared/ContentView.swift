//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/05/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add") {
                let firstName = ["Harry", "Ron", "Hermione", "Ginny"]
                let lastName = ["Potter", "Weasley", "Granger"]
                
                let chosenFirstName = firstName.randomElement()!
                let chosenLastName = lastName.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
