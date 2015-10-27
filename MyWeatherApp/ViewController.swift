//
//  ViewController.swift
//  MyWeatherApp
//
//  Created by Stoyan Yordanov Kostov on 10/23/15.
//  Copyright © 2015 com.kostov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var pageViewController: UIPageViewController!
    var forecast_days = 50
    var dataSource = [DayWeather]()
    var viewControllers = [MWAPageContentViewController?]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let downloadData = APICall()
        
        downloadData.downloadDataForCity("") { responseDict, error -> Void in
            if let err = error {
                print("<--" + err.debugDescription + "-->");
                return
            }
 
            if responseDict != nil {
                
                if let list = responseDict!["list"] as? [Dictionary<String,AnyObject>] {
                    if let days = responseDict!["cnt"] as? NSInteger { // if we receive less than we want
                        if days < self.forecast_days {
                            self.forecast_days = days
                        }
                        self.dataSource = DayWeather.getDataSourceObjects(list, forHowManyDays: self.forecast_days)
                        dispatch_async(dispatch_get_main_queue(), {
                            self.updateUi()
                        })
                    }
                }
            }
        }
    }
    
    
    func updateUi()
    {
        for var i = 0 ; i < dataSource.count ; i++ {
            if let vc = viewControllerAtIndex(i, andDayData: dataSource[i]) {
                viewControllers.append(vc)
            }
        }
        
        if let pageVC = storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as? UIPageViewController {
            if let firstVC = viewControllers[0] {
                pageViewController = pageVC
                pageViewController.dataSource = self
                pageViewController.delegate = self
                pageViewController.view.backgroundColor = UIColor(patternImage: UIImage(named: "sky")!)
          
                pageViewController.setViewControllers([firstVC], direction: .Forward, animated: true, completion: nil)
                pageViewController.view.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height-30)
                addChildViewController(pageViewController)
                view.addSubview(pageViewController.view)
                pageViewController.didMoveToParentViewController(self)
            }
        }
    }
        
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let pageVC = viewController as? MWAPageContentViewController
        var index = pageVC?.pageIndex
        
        if index == 0 || index == NSNotFound {
            return nil
        }
        
        index!--
        
        if let vc = viewControllers[index!] {
            return vc
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        let pageVC = viewController as? MWAPageContentViewController
        var index = pageVC?.pageIndex
        
        if index == viewControllers.count - 1 || index == NSNotFound {
            return nil
        }
        
        index!++
        
        if let vc = viewControllers[index!] {
            return vc
        }
        
        return nil
    }
    
    func viewControllerAtIndex(index:NSInteger, andDayData: DayWeather) -> MWAPageContentViewController?
    {
        let pageVC = storyboard?.instantiateViewControllerWithIdentifier("MWAPageContentViewController") as? MWAPageContentViewController
        pageVC?.pageIndex = index
        pageVC?.day = andDayData
        return pageVC
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return viewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }
}

