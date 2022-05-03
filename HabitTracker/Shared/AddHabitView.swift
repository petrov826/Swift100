//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by peterpetrov on 2022/05/02.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var habitList: HabitList
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                
                TextField("Description", text: $description)
            }
            .navigationTitle("Add New Habit")
            .toolbar {
                Button("Save") {
                    //
                    let newHabit = Habit(title: title, description: description)
                    habitList.items.append(newHabit)
                    dismiss()
                }
            }
        }
        
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        // passing dummy object
        AddHabitView(habitList: HabitList())
    }
}
