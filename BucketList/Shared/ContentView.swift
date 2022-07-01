//
//  ContentView.swift
//  Shared
//
//  Created by peterpetrov on 2022/06/30.
//
import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var isLocked = true
    
    var body: some View {
        VStack {
            if isLocked {
                Text("Locked")
            } else {
                Text("Unlocked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                if success {
                    isLocked = false
                } else {
                    
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
