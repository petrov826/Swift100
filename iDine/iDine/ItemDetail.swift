//
//  ItemDetail.swift
//  iDine
//
//  Created by peterpetrov on 2023/02/01.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            // use `alignment: .bottomTrailing`
            // to move Textbottom right corner
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(5)
                    .background(.black)
                    .foregroundColor(.white)
                    .font(.caption)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            
            Button("Order this") {
                order.add(item: item)
            }
            // nice looking blue button
            // instead of simple blue clickable text
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .navigationTitle(item.name)
        // ItemDetail view isn't top-level.
        // it's better to make title smaller
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
