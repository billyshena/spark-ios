//
//  ViewController.swift
//  spark
//
//  Created by Billy Shen on 06/10/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

let notificationKey = "switchPage"

class HomeViewController: UIViewController{
    
    @IBOutlet weak var Open: UIBarButtonItem!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    @IBOutlet weak var contentView: UIView!
    
    var currentViewController: UIViewController?
    
    lazy var deckVC: UIViewController? = {
        let deckVC = self.storyboard?.instantiateViewControllerWithIdentifier("DeckViewController")
        return deckVC
    }()
    lazy var progressVC : UIViewController? = {
        let progressVC = self.storyboard?.instantiateViewControllerWithIdentifier("ProgressViewController")
        return progressVC
    }()
    
    lazy var completedVC : UIViewController? = {
        let completedVC = self.storyboard?.instantiateViewControllerWithIdentifier("CompletedViewController")
        return completedVC
    }()

    
    var pageVC: UIPageViewController!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("HomeViewController")
        
        if (FBSDKAccessToken.currentAccessToken() == nil)
        {
            print("Not logged in..")
        }
        else
        {
            print("Logged in..")
        }
       
        // Set actions to be able to open the left sidebar menu
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")

        pageVC = self.storyboard?.instantiateViewControllerWithIdentifier("MyPageViewController") as! MyPageViewController
        
        // Set gesture swipe to open sidebar menu on left
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Hide the navigation bar bottom border
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        
        // Create logo UIImage object and set it as the navigation main title
        let image = UIImage(named: "logo.png")
        navigationItem.titleView = UIImageView(image: image)

//        
        segmentedControl.selectedSegmentIndex = 0
//        displayCurrentTab(0)
//      

        
    }
    

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func displayCurrentTab(tabIndex: Int){
        print("displayCurrentTab")
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {

            print("page")
            self.addChildViewController(vc)
            vc.didMoveToParentViewController(self)

            vc.view.frame = self.contentView.bounds

            self.contentView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case 0 :
            vc = deckVC
        case 1 :
            vc = progressVC
        case 2 :
            vc = completedVC
        default:
            return nil
        }
        
        return vc
    }
    
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        
        print("indexChanged", sender.selectedSegmentIndex)
       
       
        
        NSNotificationCenter.defaultCenter().postNotificationName("switchPage", object: self, userInfo: ["pageNumber": sender.selectedSegmentIndex])
        
        print("sending notification")

        
//        contentView.addSubview((progressVC?.view)!)
//        self.addChildViewController(progressVC!)
//        self.currentViewController!.view.removeFromSuperview()
//        self.currentViewController!.removeFromParentViewController()
//        
//        displayCurrentTab(sender.selectedSegmentIndex)
    }
    
    


}

