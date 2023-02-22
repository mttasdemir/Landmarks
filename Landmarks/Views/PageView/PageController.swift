//
//  PageController.swift
//  Landmarks
//
//  Created by Mustafa Taşdemir on 22.02.2023.
//

import SwiftUI

struct PageController: UIViewRepresentable {
    typealias UIViewType = UIPageControl
    let numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let pc = UIPageControl()
        pc.numberOfPages = numberOfPages
        pc.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(_:)), for: .valueChanged)
        return pc
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
 
    class Coordinator: NSObject {
        let parent: PageController
        
        init(_ parent: PageController) {
            self.parent = parent
        }
        
        @objc
        func updateCurrentPage(_ uiView: UIPageControl) {
            parent.currentPage = uiView.currentPage
        }
        
    }
    
}
