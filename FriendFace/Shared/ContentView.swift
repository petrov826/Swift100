//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/06/05.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink {
                        UserDetailView(user: user)
                    } label: {
                        HStack {
                            Text(user.name)
                            Spacer()
                            Image(systemName: "person.fill")
                                .foregroundColor(user.isActive ? .green : .red)
                        }
                    }
                }
            }
            .navigationTitle("Users")
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let decodedData = try? decoder.decode([User].self, from: data) {
                users = decodedData
            }
        } catch {
            print("Invalid JSON")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
