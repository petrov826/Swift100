//
//  FilteredList.swift
//  CoreDataProject (iOS)
//
//  Created by peterpetrov on 2022/06/02.
//

import SwiftUI

enum Predicates {
case LIKE, CONTAINS, MATCHES, BEGINSWITH, ENDSWITH
}

struct FilteredList: View {
    @FetchRequest var fetchRequest: FetchedResults<Singer>
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String, predicate: Predicates = .BEGINSWITH, sortDescriptors: [SortDescriptor<Singer>]) {
        _fetchRequest = FetchRequest<Singer>(
            sortDescriptors: sortDescriptors,
            predicate: NSPredicate(format: "lastName \(predicate) %@", filter)
        )
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}
