//
//  ItemRow.swift
//  iDine
//
//  Created by peterpetrov on 2023/01/29.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
            
            VStack(alignment: .leading) {
                Text(item.name)
                Text("$\(item.price)")
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ItemRow(item: MenuItem.example)
        }
        .listStyle(.grouped)
    }
}
