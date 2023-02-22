//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Mustafa Taşdemir on 20.02.2023.
//

import SwiftUI

struct FeatureCard: View {
    let landmark: Landmark
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .aspectRatio(1.5, contentMode: .fit)
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[2])
    }
}

struct TextOverlay: View {
    let landmark: Landmark
    
    let gradient = LinearGradient(colors: [Color.black.opacity(0.2), Color.black.opacity(0)], startPoint: .bottom, endPoint: .center)
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text("\(landmark.park)-\(landmark.city)")
                    .font(.body)
            }
            .foregroundColor(.white)
        }
        
    }
}
