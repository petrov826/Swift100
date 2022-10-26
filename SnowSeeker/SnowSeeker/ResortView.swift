//
//  ResortView.swift
//  SnowSeeker
//
//  Created by peterpetrov on 2022/10/20.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    // if the type size is so large,
                    // horizontally stacked 4 Views will be too tight
                    if horizontalSizeClass == .compact && typeSize > .large {
                        VStack(spacing: 10) {
                            SkiDetailsView(resort: resort)
                        }
                        VStack(spacing: 10) {
                            ResortDetailsView(resort: resort)
                        }
                    } else {
                        SkiDetailsView(resort: resort)
                        ResortDetailsView(resort: resort)
                    }
                    
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                // set upper bound for dynamic type size
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)
                    Text("Facilities")
                        .font(.headline)
                    // A, B, C
                    // Text(resort.facilities.joined(separator: ", "))
                    // A, B and C (much more natural!)
                    // NOTE: .list(type: .or) will output "A, B or C"
                    Text(resort.facilities, format: .list(type: .and))
                        .padding(.vertical)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(resort.name) in \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResortView(resort: Resort.example)
        }
    }
}
