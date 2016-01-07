//
//  ViewController.swift
//  spark
//
//  Created by Billy Shen on 06/10/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit


class DeckViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIGestureRecognizerDelegate{



    @IBOutlet weak var deckView: UICollectionView!
    
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
        
        
        print("DeckViewController")
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(true)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        self.navigationController?.interactivePopGestureRecognizer?.enabled = true
        
        
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
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print("cell is clicked", indexPath.row)
        let cell = deckView.cellForItemAtIndexPath(indexPath)
        //        print("cell", cell)
        
        self.performSegueWithIdentifier("showSingle", sender: cell)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("prepareSegue")
        if(segue.identifier == "showSingle"){
            let cell = sender as! UICollectionViewCell
            if let indexPath = deckView.indexPathForCell(cell) {
                let singleVC = segue.destinationViewController as! SingleDeckViewController
                singleVC.image = self.decks[indexPath.row]!
                singleVC.text = self.names[indexPath.row]
                singleVC.likeTxt = self.likes[indexPath.row]
                singleVC.ownerTxt = self.owners[indexPath.row]
                
            }
        }
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

