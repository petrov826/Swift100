//
//  ImageSaver.swift
//  InstaFilter
//
//  Created by peterpetrov on 2022/06/20.
//

import UIKit

// I don't know what I am doing...
class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc
    func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished")
    }
}
