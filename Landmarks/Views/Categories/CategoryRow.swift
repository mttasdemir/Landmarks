//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Mustafa Taşdemir on 22.03.2022.
//

import SwiftUI

struct CategoryRow: View {
    let categoryName: String
    let categoryItems: Array<Landmark>
    
    var body: some View {
        VStack(alignment: .leading) {
           Text(categoryName)
                .font(.title2)
                .padding(.leading, 15)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .bottom, spacing: 0) {
                    ForEach(categoryItems) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static let model = ModelData()
    
    static var previews: some View {
        CategoryRow(categoryName: model.categories.keys.first!, categoryItems: ModelData().categories[model.categories.keys.first!]!)
    }
}

struct CategoryItem: View {
    let landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 200, height: 170)
                .cornerRadius(15)
            Text(landmark.name)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}
