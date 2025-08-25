//
//  FirebasePhotosViewModel.swift
//  SpikeFirebase
//
//  Created by Camila Moi on 04/08/25.
//
import FirebaseStorage //parte do firebase que lida com midias
import SwiftUI
import UIKit

class MediaViewModel: ObservableObject {
    private let storage = Storage.storage()
    func uploadImage(_ image: UIImage, completion: @escaping (URL?) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(nil)
            return
        }
        let storageRef = storage.reference().child("images/\(UUID().uuidString).jpg")
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            guard error == nil else {
                print("❌ Upload falhou: \(error?.localizedDescription)")
                completion(nil)
                return
            }
            storageRef.downloadURL { url, error in
                completion(url)
            }
        }
    }
    func uploadVideo(_ videoUrl: URL, completion: @escaping (URL?) -> Void) {
        let storageRef = storage.reference().child("videos/\(UUID().uuidString).mov")
        storageRef.putFile(from: videoUrl, metadata: nil) { metadata, error in
            guard error == nil else {
                completion(nil)
                return
            }
            storageRef.downloadURL { url, error in
                completion(url)
            }
        }
    }
}
