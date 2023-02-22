//
//  CircleImage.swift
//  Landmarks
//
//  Created by Mustafa Taşdemir on 4.03.2022.
//

import SwiftUI

struct CircleImage: View {
    var landmarkImage: Image
    var body: some View {
        landmarkImage
            .frame(width: 400)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(.white, lineWidth: 5)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(landmarkImage: ModelData().landmarks[1].image)
    }
}
