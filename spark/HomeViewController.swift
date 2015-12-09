//
//  ViewController.swift
//  spark
//
//  Created by Billy Shen on 06/10/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{


    @IBOutlet weak var userPoints: UIBarButtonItem!

    @IBOutlet weak var deckView: UICollectionView!
//    @IBOutlet weak var progressView: UIView!
//    @IBOutlet weak var completedView: UIView!

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var Open: UIBarButtonItem!
    let decks = [
        UIImage(named: "music"),
        UIImage(named: "sport"),
        UIImage(named: "travel"),
        UIImage(named: "culture"),
        UIImage(named: "food"),
        UIImage(named: "history"),
        UIImage(named: "sex"),
        UIImage(named: "nature")
    ]
    let names = [ "Music", "Sports", "Travel", "Culture", "Food", "History", "Sex", "Nature"]
    let likes = ["336 likes" , "122 likes", "10 likes", "89 likes", "336 likes" , "122 likes", "10 likes", "89 likes"]

    let owners = ["by spark", "by spark", "by spark", "by spark", "by spark", "by spark", "by spark", "by spark"]
    
    let points = ["10", "35", "65", "100", "28", "13", "98", "77"]
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Show the first view and hide the other ones
        deckView.backgroundColor = Constants.Colors.bgLightGrey

        
        // Set actions to be able to open the left sidebar menu
        Open.target = self.revealViewController()
        Open.action = Selector("revealToggle:")
    
        let font = UIFont(name: "Helvetica Neue", size: 18)
        userPoints.setTitleTextAttributes([NSFontAttributeName: font!], forState:UIControlState.Normal)
        
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
    
    
    // Returns the number of elements
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.decks.count
    }
    
    
    // Creating the custom cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! DeckViewCell
    
        cell.points?.text = self.points[indexPath.row]

        cell.layer.cornerRadius = 6
        cell.separator?.layer.cornerRadius = (cell.separator?.frame.size.width)! / 2
        cell.separator?.alpha = 0.5
        cell.deckName?.text = self.names[indexPath.row]
        cell.deckName?.font = UIFont(name: "Helvetica Neue", size: 24)
        
        cell.likes?.font = UIFont(name: "Helvetica Neue", size: 11)
        cell.likes?.text = self.likes[indexPath.row]
        cell.likes?.alpha = 0.5
        
        cell.owner?.alpha = 0.5
        cell.owner?.font = UIFont(name: "Helvetica Neue", size: 11)
        cell.owner?.text = self.owners[indexPath.row]
        
        cell.imageView?.layer.cornerRadius = 6
        cell.imageView?.image =  self.decks[indexPath.row]

        
        return cell
    }
    
    // Return the height and width of a cell according to the screen size
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.frame.size.width - 38)/2, height: collectionView.frame.size.height/3)
    }
    
    
    // Listener when a cell is selected
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        
        print("cell is clicked")
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(12, 12, 12, 12);
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
    
        return 7
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 12
    }
    
    



}

