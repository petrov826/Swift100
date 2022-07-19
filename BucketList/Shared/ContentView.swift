//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/06/30.
//
import LocalAuthentication
import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        if !viewModel.isLocked {
            ZStack {
                Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundColor(.orange)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(Circle())
                            Text(location.name)
                                .fixedSize()
                        }
                        .onTapGesture {
                            viewModel.selectedPlace = location
                        }
                    }
                }
                .ignoresSafeArea()
                
                Circle()
                    .fill(.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            viewModel.addLocation()
                        } label: {
                            Image(systemName: "plus")
                        }
                        .padding()
                        .background(.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                    }
                }
            }
            // new syntax of .sheet modifier
            // when user dismissed the sheet, selectedPlace will be set back to nil
            .sheet(item: $viewModel.selectedPlace) { place in // place will be unwrapped by Swift
                EditView(location: place) { newLocation in
                    viewModel.update(location: newLocation)
                }
            }
        } else {
            Button("Unlock") {
                viewModel.authenticate()
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
