//
//  ViewController.swift
//  spark
//
//  Created by Billy Shen on 06/10/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var deckView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var completedView: UIView!
    @IBOutlet weak var Open: UIBarButtonItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Show the first view and hide the other ones
        deckView.hidden = false
        completedView.hidden = true
        progressView.hidden = true
        
        // Set actions to be able to open the left sidebar menu
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
        
        // Set gesture swipe to open sidebar menu on left
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Hide the navigation bar bottom border
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        
        // Create logo UIImage object and set it as the navigation main title
        let image = UIImage(named: "logo.png")
        self.navigationItem.titleView = UIImageView(image: image)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            deckView.hidden = false
            completedView.hidden = true
            progressView.hidden = true
        case 1:
            deckView.hidden = true
            completedView.hidden = true
            progressView.hidden = false
        case 2:
            deckView.hidden = true
            completedView.hidden = false
            progressView.hidden = true
        default:
            break;
        }
    }
}

