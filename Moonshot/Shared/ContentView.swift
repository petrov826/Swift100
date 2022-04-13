//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/04/12.
//

import SwiftUI

// define 2 structs by mimicing
// the structure of input JSON string
struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    @State private var decodedUser = User(name: "", address: Address(street: "", city: ""))
    
    var body: some View {
        VStack(spacing: 30) {
            Button("Decode JSON") {
                let input = """
                {
                    "name": "Jack",
                    "address": {
                        "street": "Apple Street",
                        "city": "San Jose"
                    }
                }
                """
                
                let data = Data(input.utf8)
                
                if let user = try? JSONDecoder().decode(User.self, from: data) {
                    decodedUser = user
                }
            }
            
            Text("Decode Result")
            
            VStack(alignment: .leading) {
                Text("name: \(decodedUser.name)")
                Text("street: \(decodedUser.address.street)")
                Text("city: \(decodedUser.address.city)")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
