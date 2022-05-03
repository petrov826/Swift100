//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/05/02.
//

import SwiftUI

struct ContentView: View {
    // source of truth
    @StateObject var habitList: HabitList = HabitList()
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habitList.items) { habit in
                    HabitRow(habit: habit)
                        .onTapGesture {
                            if let tappedIndex = habitList.items.firstIndex(where: { $0.id == habit.id }) {
                                habitList.items[tappedIndex].count += 1
                            }
                        }
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("Hibit Tracker")
            .toolbar {
                Button("New Habit") {
                    showingSheet = true
                }
            }
            .sheet(isPresented: $showingSheet) {
                AddHabitView(habitList: habitList)
            }
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        habitList.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
