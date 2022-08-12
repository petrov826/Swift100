//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/08/08.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { succuess, error in
                    if succuess {
                        print("All set!")
                    // else + if let unwrapping
                    // we can say simply else here
                    // and unwrap `error` inside else
                    } else if let error = error {
                        print("error: \(error.localizedDescription)")
                    }
                }
            }
            
            Button("Schedule Notification") {
                // what to show
                let content = UNMutableNotificationContent()
                content.title = "Feed the dogs"
                content.subtitle = "They look hungry"
                content.sound = .default
                
                // when to show
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                // create request from content and trigger
                // UUID().uuidString returns a random string
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
