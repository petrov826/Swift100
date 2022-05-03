//
//  HabitRow.swift
//  HabitTracker
//
//  Created by peterpetrov on 2022/05/02.
//

import SwiftUI

struct HabitRow: View {
    var habit: Habit
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(habit.title)
                    .font(.body)
                Text(habit.description)
                    .font(.caption)
            }
            
            Spacer()
            
            Text("\(habit.count)")
                .font(.subheadline)
                        
            Button {
                //
            } label: {
                Image(systemName: "plus")
            }
        }
        .overlay {
            // onTapGesture are not called when the spacer got tapped,
            // so overlay with invisible view
            Color.gray.opacity(0.01)
        }
    }
}

struct HabitRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                // dummy object typeof Habit
                HabitRow(habit: Habit(title: "Walk", description: "Take a walk for 30mins"))
            }
        }
    }
}
