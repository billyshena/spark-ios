//
//  PageViewController.swift
//  spark
//
//  Created by Billy Shen on 04/01/2016.
//  Copyright © 2016 Billy Shen. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("PageViewController")
        
        self.delegate = self
        self.dataSource = self
        let page1: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("DeckViewController")
        let page2: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("ProgressViewController")
        let page3: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("CompletedViewController")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        setViewControllers([page1], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "setPage:", name: "switchPage", object: nil)

        
    }
    
    
    func setPage(notification: NSNotification) {
        print("notification", notification)
        print("name", notification.userInfo!["index"])
        // First try to cast user info to expected type
        if let info = notification.userInfo as? Dictionary<String, Int> {
            // Check if value present before using it
            if let s = info["pageNumber"] {
                
                let page = pages[s]
                setViewControllers([page], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
                
            }
            else {
                print("no value for key\n")
            }
        }
        else {
            print("wrong userInfo type")
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.indexOf(viewController)!
        if currentIndex > 0 {
            return pages[currentIndex - 1]
        }

        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.indexOf(viewController)!
        let nextIndex = abs((currentIndex + 1) % pages.count)
        return pages[nextIndex]
    }
    
    
    func displayPageForIndex(index: Int) {
        
        print("displayPageIndex", index)
        

    }

}
