//
//  LandmarkData.swift
//  Landmarks
//
//  Created by Mustafa Taşdemir on 19.03.2022.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var landmarks: Array<Landmark> = loadData(fileName: "landmarkData.json")
    
    var categories: Dictionary<String, Array<Landmark>> {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    var features: Array<Landmark> {
        landmarks.filter { $0.isFeatured }
    }
}

func loadData<T: Decodable>(fileName: String) -> Array<T> {
    guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("File not found")
    }
    
    guard let data = try? Data(contentsOf: fileUrl) else {
        fatalError("File reading error")
    }
    
    guard let landmarks = try? JSONDecoder().decode(Array<T>.self, from: data) else {
        fatalError("Decode error")
    }
    
    return landmarks
}
