//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/06/30.
//

import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct ContentView: View {
    @State var loadingState = LoadingState.loading
    
    var body: some View {
        Group {
            switch loadingState {
            case .loading:
                LoadingView()
            case .success:
                SuccessView()
            case .failed:
                FailedView()
            }
        }
        .onTapGesture {
            switch loadingState {
            case .loading:
                loadingState = .success
            case .success:
                loadingState = .failed
            case .failed:
                loadingState = .loading
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
