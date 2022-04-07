//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/03/31.
//

import SwiftUI

struct ContentView: View {
    // when expenses got updated, body will be re-computed
    @StateObject var expenses: Expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                // ForEach(expenses, id: \.name) doesn't work
                // because expenses isn't a list
                // it's an instance of Expenses class
                // that contains a list
                
                // now, each ExpenseItem has UUID
                // we should use "id: \.id" instead of "id: \.name"
                // and ExpenseItem conforms to Identifiable protocol,
                // no need to specify id anymore
                // so we can say ForEach(expenses.items). Nice and simple!
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    // test code
                    // let expense = ExpenseItem(name: "test", type: "personal", amount: 5)
                    // expenses.items.append(expense)
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                // share expenses with AddView
                // not creating another expenses object
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
