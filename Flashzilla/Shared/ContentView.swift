//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Test success feedback")
                .padding()
                .onTapGesture {
                    getFeedback(.success)
                }
            
            Text("Test warning feedback")
                .padding()
                .onTapGesture {
                    getFeedback(.warning)
                }
            
            Text("Test error feedback")
                .padding()
                .onTapGesture {
                    getFeedback(.error)
                }
        }
    }
    
    func getFeedback(_ feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(feedbackType)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
