//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by peterpetrov on 2022/10/20.
//

import SwiftUI

struct SkiDetailsView: View {
    let resort: Resort
    
    var body: some View {
        Group {
            VStack {
                Text("Elevation")
                    .font(.caption.bold())
                Text("\(resort.elevation)m")
                    .font(.title3)
            }
            VStack {
                Text("Snow Depth")
                    .font(.caption.bold())
                Text("\(resort.snowDepth)")
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            SkiDetailsView(resort: Resort.example)
        }
    }
}
