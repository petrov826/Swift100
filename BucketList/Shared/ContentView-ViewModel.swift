//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by peterpetrov on 2022/07/11.
//

import Foundation
import LocalAuthentication
import MapKit

// this refactor is not just moved codes from A to B
// this will make it much easier to write tests.
extension ContentView {
    // @MainActor is responsible for updating all UIs
    @MainActor class ViewModel: ObservableObject {
        @Published var mapRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 50, longitude: 0),
            span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25)
        )
        
        // let's change locations readonly
        @Published private(set) var locations: [Location]
        @Published var selectedPlace: Location?
        @Published var isLocked = true
        @Published var showingFaceIDAlert = false
        @Published var faceIDAlertMessage = ""
        
        let savePath = FileManager.documentDirectory.appendingPathComponent("SavePlaces")
        
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func addLocation() {
            let newLocation = Location(
                id: UUID(),
                name: "New location",
                description: "",
                latitude: mapRegion.center.latitude,
                longitude: mapRegion.center.longitude
            )
            locations.append(newLocation)
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace = selectedPlace else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    if success {
                        // Task { @MainActor in
                        // will work too.
                        Task {
                            await MainActor.run {
                                self.isLocked = false
                            }
                        }
                    } else {
                        Task { @MainActor in
                            // show alert and error message in View
                            // (this is a ViewModel)
                            self.showingFaceIDAlert = true
                            if let authenticationError = authenticationError {
                                self.faceIDAlertMessage = self.getAuthenticationErrorMessage(errorCode: authenticationError._code)
                            }
                        }
                    }
                }
            } else {
                // no biometrics
            }
        }
        
        func getAuthenticationErrorMessage(errorCode: Int) -> String {
            switch errorCode {
            case LAError.appCancel.rawValue:
                return "You canceled."
            case LAError.authenticationFailed.rawValue:
                return "FaceID auth failed."
            default:
                return "Something went wrong."
            }
        }
    }
}
