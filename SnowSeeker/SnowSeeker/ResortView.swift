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
    
    @EnvironmentObject private var favorites: Favorites
    
    @State private var selectedFacility: Facility?
    @State private var showingFacilityAlert = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                    .overlay {
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                Text(resort.imageCredit)
                                    .foregroundColor(.secondary)
                                    .padding(.all, 8)
                            }
                        }
                    }
                
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
                    // Text(resort.facilities, format: .list(type: .and))
                    //    .padding(.vertical)
                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            Button {
                                selectedFacility = facility
                                showingFacilityAlert = true
                            } label: {
                                facility.icon
                                    .font(.title)
                            }
                        }
                    }
                    
                    // add or remove this resort
                    Button(favorites.contains(resort) ? "Remove from favorites" : "Add to favorites") {
                        if favorites.contains(resort) {
                            favorites.remove(resort)
                        } else {
                            favorites.add(resort)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(resort.name) in \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(
            selectedFacility?.name ?? "More information",
            isPresented: $showingFacilityAlert,
            presenting: selectedFacility
        ) { _ in
            // use default actions
        } message: { facility in
            Text(facility.description)
        }
        
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResortView(resort: Resort.example)
        }
        .environmentObject(Favorites())
    }
}
