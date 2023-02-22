//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Mustafa Taşdemir on 4.03.2022.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
