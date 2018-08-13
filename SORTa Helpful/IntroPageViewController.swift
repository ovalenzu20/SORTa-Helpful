//
//  IntroPageViewController.swift
//  SORTa Helpful
//
//  Created by Teran on 8/8/18.
//  Copyright © 2018 OB Devs. All rights reserved.
//

import UIKit

class IntroPageViewController: UIPageViewController {
    var introPageControl = UIPageControl()

    func configurePageControl() {
        introPageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width, height: 50))
        self.introPageControl.numberOfPages = introPages.count
        self.introPageControl.currentPage = 0
        self.introPageControl.tintColor = UIColor.black
        self.introPageControl.pageIndicatorTintColor = UIColor.black
        self.introPageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(introPageControl)
    }
    
    
    fileprivate lazy var introPages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "page1"),
            self.getViewController(withIdentifier: "page2"),
            self.getViewController(withIdentifier: "page3")
        ]
    }()
    
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate   = self
        
        if let firstViewController = introPages.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        self.configurePageControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



extension IntroPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex = introPages.index(of: viewController)!
        let previousIndex = currentIndex - 1
        return (previousIndex == -1) ? nil : introPages[previousIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = introPages.index(of: viewController)!
        let nextIndex = currentIndex + 1
        return (nextIndex == introPages.count) ? nil : introPages[nextIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.introPageControl.currentPage = introPages.index(of: pageContentViewController)!
    }
}
