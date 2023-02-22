//
//  PageViewController.swift
//  Landmarks
//
//  Created by Mustafa Taşdemir on 20.02.2023.
//

import SwiftUI

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIPageViewController
    var pages: Array<Page>
    @Binding var pageIndex: Int

    func makeCoordinator() -> PageViewCoordinator {
        PageViewCoordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pvc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pvc.dataSource = context.coordinator
        pvc.delegate = context.coordinator
        return pvc
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([context.coordinator.controllers[pageIndex]], direction: .forward, animated: true)
    }
    
    class PageViewCoordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        let parent: PageViewController
        let controllers: Array<UIViewController>
        
        init(_ parent: PageViewController) {
            self.parent = parent
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let currentIndex = controllers.firstIndex(of: viewController) else { return nil }
            return currentIndex == controllers.startIndex ? controllers.last : controllers[currentIndex - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let currentIndex = controllers.firstIndex(of: viewController) else { return nil }
            return currentIndex == controllers.endIndex-1 ? controllers.first : controllers[currentIndex + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.pageIndex = index
            }
        }
        
    }
    
}
