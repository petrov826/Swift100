//
//  ItemRow.swift
//  iDine
//
//  Created by peterpetrov on 2023/01/29.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    
    let roundedRectangle = RoundedRectangle(cornerRadius: 5, style: .continuous)
    
    let restrictionToColor: [String: Color] = [
        "D": .purple, // diet
        "G": .black, // gluten
        "N": .red, // nuts
        "S": .blue, // spicy?
        "V": .green // vegetable
    ]
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(roundedRectangle)
                .overlay(roundedRectangle.stroke(.gray, lineWidth: 2))
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            
            Spacer()
            
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(restrictionToColor[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
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
