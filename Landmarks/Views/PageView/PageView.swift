//
//  PageView.swift
//  Landmarks
//
//  Created by Mustafa Taşdemir on 21.02.2023.
//

import SwiftUI

struct PageView<Page: View>: View {
    @State private var pageIndex = 0
    var pages: [Page]
    var body: some View {
        ZStack(alignment: .bottomTrailing) {                PageViewController(pages: pages, pageIndex: $pageIndex)
            PageController(numberOfPages: pages.count, currentPage: $pageIndex)
                .frame(width: CGFloat(pages.count) * 18.0)
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map {FeatureCard(landmark: $0)})
            .aspectRatio(1.5, contentMode: .fit)
    }
}
