//
//  ViewController.swift
//  MyWeatherApp
//
//  Created by Stoyan Yordanov Kostov on 10/23/15.
//  Copyright © 2015 com.kostov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController: UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let downloadData = APICall()
        
        if let pageVC = storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as? UIPageViewController {
            pageViewController = pageVC
            pageViewController.dataSource = self
        }
        
        if let startingVC = viewControllerAtIndex(0) {
            if pageViewController != nil {
                pageViewController.setViewControllers([startingVC], direction: .Forward, animated: true, completion: nil)
                pageViewController.view.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height-30)
                
                addChildViewController(pageViewController)
                view.addSubview(pageViewController.view)
                pageViewController.didMoveToParentViewController(self)
            }
        }
        
        downloadData.downloadDataForCity("") { responseDict, error -> Void in
            if let err = error {
                print("<--" + err.debugDescription + "-->");
            }
            if let dictonary = responseDict {
                print(dictonary)
            }
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let pageVC = viewController as? MWAPageContentViewController
        var index = pageVC?.pageIndex
        
        if index == 0 || index == NSNotFound {
            return nil
        }
        
        index!--
        
        if let vc = viewControllerAtIndex(index!) {
            return vc
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let pageVC = viewController as? MWAPageContentViewController
        var index = pageVC?.pageIndex
        
        if index == 0 || index == NSNotFound {
            return nil
        }
        
        index!++
        
        if let vc = viewControllerAtIndex(index!) {
            return vc
        }
        
        return nil
    }
    
    func viewControllerAtIndex(index:NSInteger) -> MWAPageContentViewController? {
        let pageVC = storyboard?.instantiateViewControllerWithIdentifier("MWAPageContentViewController") as? MWAPageContentViewController
        pageVC?.pageIndex = index
        return pageVC
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 1
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

