//
//  OnboardingContainerViewController.swift
//  Bankey
//
//  Created by Thilagawathy Duraisamy on 21/3/2024.
//

import Foundation
import UIKit

class OnboardingContainerViewController: UIViewController {
   
    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentViewController: UIViewController {
        didSet {
            
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let pageOneViewController = PageOneViewController()
        let pageTwoViewController = PageTwoViewController()
        let pageThreeViewController = PageThreeViewController()
        
        pages.append(pageOneViewController)
        pages.append(pageTwoViewController)
        pages.append(pageThreeViewController)
        
        currentViewController = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented ")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        print(#function,"pageview controller -> viewController \(pageViewController.view)")
        pageViewController.didMove(toParent: self)
       
        pageViewController.dataSource = self
        layout()
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        currentViewController = pages.first!
    }
    
}

extension OnboardingContainerViewController {
    
    private func layout() {
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
      
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor)
        ])
    }
}

extension OnboardingContainerViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(viewControllerBefore: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(viewControllerAfter: viewController)
    }
    
    private func getPreviousViewController(viewControllerBefore viewController: UIViewController) -> UIViewController?{
//        print(#function,"previous view controller \(pages[0])")
//        currentViewController = pages[2]
//        return pages[0]
        switch viewController {
        case is PageOneViewController:
            currentViewController = pages[2]
            return pages[2]
        case is PageTwoViewController:
            currentViewController = pages[0]
            return pages[0]
        case is PageThreeViewController:
            currentViewController = pages[1]
            return pages[1]
        default:
            currentViewController = pages[0]
            return pages[0]
        }
    }
    
    private func getNextViewController(viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        print(#function,"Next view controller \(pages[2])")
//        currentViewController = pages[2]
//        return pages[2]
        switch viewController {
        case is PageOneViewController:
            currentViewController = pages[1]
            return pages[1]
        case is PageTwoViewController:
            currentViewController = pages[2]
            return pages[2]
        case is PageThreeViewController:
            currentViewController = pages[0]
            return pages[0]
        default:
            currentViewController = pages[0]
            return pages[0]
        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        print(#function,"total view controller \(pages.count)")
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        print(#function,"current view controller \(currentViewController)")
        return pages.firstIndex(of: currentViewController) ?? 0
    }
    
}
// MARK:
class PageOneViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}

class PageTwoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}

class PageThreeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
}

