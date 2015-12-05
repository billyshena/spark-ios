//
//  ViewController.swift
//  spark
//
//  Created by Billy Shen on 06/10/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {



    @IBOutlet weak var deckView: UIView!
//    @IBOutlet weak var progressView: UIView!
//    @IBOutlet weak var completedView: UIView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var Open: UIBarButtonItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Show the first view and hide the other ones
        deckView.hidden = false
   
        
        // Set actions to be able to open the left sidebar menu
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        
        // Set gesture swipe to open sidebar menu on left
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Hide the navigation bar bottom border
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        
        // Create logo UIImage object and set it as the navigation main title
        let image = UIImage(named: "logo.png")
        navigationItem.titleView = UIImageView(image: image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
//            progressView.hidden = true
//            completedView.hidden = true
            deckView.hidden = false
        case 1:
//            progressView.hidden = false
//            completedView.hidden = true
            deckView.hidden = true
        case 2:
//            completedView.hidden = false
//            progressView.hidden = true
            deckView.hidden = true
        default:
            break;
        }
    }
}

