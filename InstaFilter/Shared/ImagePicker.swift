//
//  ImagePicker.swift
//  InstaFilter
//
//  Created by peterpetrov on 2022/06/13.
//

import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images // images only. no video
        
        let picker = PHPickerViewController(configuration: config)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        //
    }
    
    // Hack for code generation
    // typealias UIViewControllerType = PHPickerViewController
}
