//
//  ShortInfoView.swift
//  Landmarks
//
//  Created by Mustafa Taşdemir on 4.03.2022.
//

import SwiftUI

struct ShortInfoView: View {
    @EnvironmentObject private var modelData: ModelData
    var landmark: Landmark
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex { $0.id == landmark.id }!
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(landmark.name)
                    .font(.title)
                    .fontWeight(.bold)
                FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
            }
            HStack {
                Text(landmark.park)
                Spacer()
                Text(landmark.city)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct ShortInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ShortInfoView(landmark: ModelData().landmarks[0])
    }
}
