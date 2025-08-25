//
//  SpikeFirebaseApp.swift
//  SpikeFirebase
//
//  Created by Camila Moi on 01/08/25.
//

import SwiftUI
import SwiftData
import Firebase
import FirebaseAppCheck
import FirebaseCore

@main
struct SpikeFirebaseApp: App {
    init() {
               FirebaseApp.configure()
               
               #if DEBUG
               let providerFactory = AppCheckDebugProviderFactory()
               AppCheck.setAppCheckProviderFactory(providerFactory)
               #endif
           }

    var body: some Scene {
        WindowGroup {
            FContentView()
        }
    }
}
