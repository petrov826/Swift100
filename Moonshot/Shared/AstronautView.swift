//
//  AstronautView.swift
//  Moonshot
//
//  Created by peterpetrov on 2022/04/17.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        NavigationView {
            // force unwrap
            // generally, this should be avoided
            AstronautView(astronaut: astronauts["armstrong"]!)
                .preferredColorScheme(.dark)
        }
    }
}
