//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Mustafa Taşdemir on 20.03.2022.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Image(systemName: "star.fill")
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: Binding.constant(false))
    }
}
