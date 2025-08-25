//
//  AddPhotosView.swift
//  SpikeFirebase
//
//  Created by Camila Moi on 04/08/25.
//

import SwiftUI

struct AddMediaView: View {
    @State private var selectedImage: UIImage?
    @State private var selectedVideoUrl: URL?
    @State private var showImagePicker = false
    @ObservedObject private var firebaseManager = MediaViewModel()
    var body: some View {
        VStack {
                   if let selectedImage = selectedImage {
                       Image(uiImage: selectedImage)
                           .resizable()
                           .scaledToFit()
                           .frame(width: 300, height: 300)
                   }
                   if selectedVideoUrl != nil {
                       Text("Video selected")
                   }
                   Button(action: {
                       showImagePicker = true
                   }) {
                       Text("Select Photo/Video")
                           .foregroundColor(.white)
                           .padding()
                           .background(Color.blue)
                           .cornerRadius(8)
                   }
                   .sheet(isPresented: $showImagePicker) {
                       ImagePicker(selectedImage: $selectedImage, selectedVideoUrl: $selectedVideoUrl)
                   }
                   if let image = selectedImage {
                       Button(action: {
                           firebaseManager.uploadImage(image) { url in
                               if let url = url {
                                   print("Image uploaded: \(url)")
                               }
                           }
                       }) {
                           Text("Upload Photo")
                               .foregroundColor(.white)
                               .padding()
                               .background(Color.green)
                               .cornerRadius(8)
                       }
                   }
                   if let videoUrl = selectedVideoUrl {
                       Button(action: {
                           firebaseManager.uploadVideo(videoUrl) { url in
                               if let url = url {
                                   print("Video uploaded: \(url)")
                               }
                           }
                       }) {
                           Text("Upload Video")
                               .foregroundColor(.white)
                               .padding()
                               .background(Color.green)
                               .cornerRadius(8)
                       }
                   }
               }
               .padding()
           }
    }


#Preview {
    AddMediaView()
}
