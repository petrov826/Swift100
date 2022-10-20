//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by peterpetrov on 2022/10/20.
//

import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort
    
    // 2 computed properties for making
    // our body property smaller
    var size: String {
        // resort.size is range of 1...3
        switch resort.size {
        case 1:
            return "Small"
        case 3:
            return "Large"
        default:
            return "Average"
        }
    }
    
    var price: String {
        // resort.price is range of 1...3
        String(repeating: "$", count: resort.price)
    }
    
    var body: some View {
        Group {
            VStack {
                Text("Size")
                    .font(.caption.bold())
                Text(size)
                    .font(.title3)
            }
            
            VStack {
                Text("Price")
                    .font(.caption.bold())
                Text(price)
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ResortDetailsView(resort: Resort.example)
        }
    }
}
