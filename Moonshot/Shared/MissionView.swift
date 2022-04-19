//
//  MissionView.swift
//  Moonshot
//
//  Created by peterpetrov on 2022/04/15.
//

import SwiftUI

struct MissionView: View {
    struct Crew {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [Crew]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    Text(mission.formattedLaunchDate)
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    ScrollableCrewView(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { crew in
            if let astronaut = astronauts[crew.name] {
                return Crew(role: crew.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(crew.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        NavigationView {
            MissionView(mission: missions[1], astronauts: astronauts)
                .preferredColorScheme(.dark)
        }
    }
}

struct ScrollableCrewView: View {
    // we can't access Crew type directly
    // because it lives inside MissionView
    let crew: [MissionView.Crew]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crew in
                    NavigationLink {
                        AstronautView(astronaut: crew.astronaut)
                    } label: {
                        Image(crew.astronaut.id)
                            .resizable()
                            .frame(width: 104, height: 72)
                            .clipShape(Capsule())
                            .overlay {
                                Capsule()
                                    .strokeBorder(.white, lineWidth: 1)
                            }
                        VStack(alignment: .leading) {
                            Text(crew.astronaut.name)
                                .foregroundColor(.white)
                                .font(.headline)
                            
                            Text(crew.role)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
