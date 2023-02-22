//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Mustafa Taşdemir on 7.03.2022.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            VStack {
                MapView(cllocCoordinate: landmark.cllocCoordinate)
                    .frame(height: 350)
                CircleImage(landmarkImage: landmark.image)
                    .offset(x: 0, y: -160)
                    .padding(.bottom, -130.0)
                ShortInfoView(landmark: landmark)
            }
            Divider()
            
            VStack(alignment: .leading) {
                Text(landmark.park)
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
