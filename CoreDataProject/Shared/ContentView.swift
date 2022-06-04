//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/05/30.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        VStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(country.wrappedFullName) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            
            Button("Add Examples") {
                let candy1 = Candy(context: moc)
                candy1.name = "Mars"
                candy1.origin = Country(context: moc)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"
                
                let candy2 = Candy(context: moc)
                candy2.name = "KitKat"
                candy2.origin = Country(context: moc)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"
                
                let candy3 = Candy(context: moc)
                candy3.name = "Puchao"
                candy3.origin = Country(context: moc)
                candy3.origin?.shortName = "JP"
                candy3.origin?.fullName = "Japan"
                
                let candy4 = Candy(context: moc)
                candy4.name = "e-ma"
                candy4.origin = Country(context: moc)
                candy4.origin?.shortName = "JP"
                candy4.origin?.fullName = "Japan"
                
                try? moc.save()
            }
            
            FilteredList(
                filter: "J",
                predicate: .BEGINSWITH,
                sortDescriptors: [
                    SortDescriptor(\.firstName),
                    SortDescriptor(\.lastName)
                ]
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
