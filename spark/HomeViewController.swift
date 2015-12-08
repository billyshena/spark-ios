//
//  ViewController.swift
//  spark
//
//  Created by Billy Shen on 06/10/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {



    @IBOutlet weak var deckView: UICollectionView!
//    @IBOutlet weak var progressView: UIView!
//    @IBOutlet weak var completedView: UIView!

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var Open: UIBarButtonItem!
    let decks = [
        UIImage(named: "travel"),
        UIImage(named: "adventure"),
        UIImage(named: "food"),
        UIImage(named: "history"),
        UIImage(named: "animals"),
        UIImage(named: "culture"),
        UIImage(named: "relationship"),
        UIImage(named: "nature")
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Show the first view and hide the other ones
//        deckView.hidden = false
        deckView.backgroundColor = Constants.Colors.bgLightGrey

        
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
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.decks.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! DeckViewCell
    

        cell.imageView?.layer.borderColor = Constants.Colors.cardBorder
        cell.imageView?.layer.borderWidth = 1
        cell.layer.cornerRadius = 6
        cell.imageView?.layer.cornerRadius = 6
        cell.imageView?.image =  self.decks[indexPath.row]

        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        
        print("cell is clicked")
        



    }

    
    

//    @IBAction func indexChanged(sender: UISegmentedControl) {
//        switch segmentedControl.selectedSegmentIndex
//        {
//        case 0:
////            progressView.hidden = true
////            completedView.hidden = true
////            deckView.hidden = false
//        case 1:
////            progressView.hidden = false
////            completedView.hidden = true
////            deckView.hidden = true
//        case 2:
////            completedView.hidden = false
////            progressView.hidden = true
////            deckView.hidden = true
//        default:
//            break;
//        }
//    }
}

