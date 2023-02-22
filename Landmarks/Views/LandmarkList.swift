//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Mustafa Taşdemir on 19.03.2022.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject private var modelData: ModelData
    @State private var showFavotiresOnly: Bool = false
    
    var filteredLandmarks: Array<Landmark> {
        modelData.landmarks.filter { landmark in
            !showFavotiresOnly || landmark.isFavorite
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavotiresOnly) {
                    Text("Show Favorites Only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: { LandmarkRow(landmark: landmark) }
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
