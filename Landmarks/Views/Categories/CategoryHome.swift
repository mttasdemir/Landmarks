//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Mustafa Taşdemir on 22.03.2022.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject private var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
//                modelData.features[0].image
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: 200)
//                    .clipped()
//                    .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                PageView(pages: modelData.features.map {FeatureCard(landmark: $0)})
                    .aspectRatio(1.5, contentMode: .fit)
                ForEach(modelData.categories.keys.sorted(), id: \.self) { category in
                    CategoryRow(categoryName: category, categoryItems: modelData.categories[category]!)
                }
            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
