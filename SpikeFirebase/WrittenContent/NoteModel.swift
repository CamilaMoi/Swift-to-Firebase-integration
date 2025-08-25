//
//  FireStoreModel.swift
//  SpikeFirebase
//
//  Created by Camila Moi on 01/08/25.
//

import Foundation
import FirebaseFirestore

struct Note: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var content: String
}
