//
//  MeView.swift
//  HotProspects
//
//  Created by peterpetrov on 2022/08/14.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
    @State private var name = "Anonimous"
    @State private var emailAddress = "you@yoursite.com"
    @State private var qrCode = UIImage()
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView {
            Form {
                Section("Name") {
                    TextField("Name", text: $name)
                        .textContentType(.name)
                        .font(.title2)
                }
                
                Section("Email Address") {
                    TextField("Email address", text: $emailAddress)
                        .textContentType(.emailAddress)
                    .font(.title2)
                }
                
                
                // UIImage(generated QR Code) -> Image
                Section("QR Code") {
                    Image(uiImage: qrCode)
                        .resizable() // QR Code will big but blurry
                        .interpolation(.none) // this comes to rescue
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .contextMenu {
                            Button {
                                // save code to photos
                                // let uiImage = generateQRCode(from: "\(name)\n\(emailAddress)")
                                let imageSaver = ImageSaver()
                                imageSaver.writeToPhotoAlbum(image: qrCode)
                            } label: {
                                Label("Save to Photos", systemImage: "square.and.arrow.down") // 􀈄
                            }
                        }
                }
            }
            .navigationTitle("Your code")
            .onAppear { updateCode() }
            .onChange(of: [name, emailAddress]) { _ in updateCode() }
        }
    }
    
    func updateCode() {
        qrCode = generateQRCode(from: "\(name)\n\(emailAddress)")
    }
    
    func generateQRCode(from string: String) -> UIImage {
        // String -> Data
        filter.message = Data(string.utf8)
        
        // Data -> CIImage
        if let outputImage = filter.outputImage {
            // CIImage -> CGImage
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                // CGImage -> UIImage
                return UIImage(cgImage: cgImage)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
