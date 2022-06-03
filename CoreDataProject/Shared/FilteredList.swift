//
//  FilteredList.swift
//  CoreDataProject (iOS)
//
//  Created by peterpetrov on 2022/06/02.
//

import SwiftUI

struct FilteredList: View {
    @FetchRequest var fetchRequest: FetchedResults<Singer>
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String) {
        _fetchRequest = FetchRequest<Singer>(
            sortDescriptors: [],
            predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter)
        )
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}
