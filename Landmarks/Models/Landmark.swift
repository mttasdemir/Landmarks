//
//  Landmark.swift
//  Landmarks
//
//  Created by Mustafa Taşdemir on 19.03.2022.
//

import Foundation
import SwiftUI
import MapKit

struct Landmark: Identifiable, Decodable {

    let id: Int
    let name: String
    let city: String
    let state: String
    let isFeatured: Bool
    var isFavorite: Bool
    let park: String
    let description: String
    private let coordinates: Coordinates
    private let imageName: String
    
    init(id: Int, name: String, category: Category, city: String, state: String, isFeatured: Bool, isFavorite: Bool, park: String, description: String, coordinates: Landmark.Coordinates, imageName: String) {
        self.id = id
        self.name = name
        self.category = category
        self.city = city
        self.state = state
        self.isFeatured = isFeatured
        self.isFavorite = isFavorite
        self.park = park
        self.description = description
        self.coordinates = coordinates
        self.imageName = imageName
    }
    
    let category: Category
    enum Category: String, CaseIterable, Decodable {
        case river = "Rivers"
        case lake = "Lakes"
        case mountain = "Mountains"
    }
    
    struct Coordinates: Decodable {
        let longitude: Double
        let latitude: Double
    }

    var image: Image {
        Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    var cllocCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
}
