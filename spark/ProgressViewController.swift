//
//  ProgressViewController.swift
//  spark
//
//  Created by Billy Shen on 14/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet weak var progressView: UICollectionView!
    
    
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
    
    override func viewDidLoad() {
        
        print("ProgressViewController")
        super.viewDidLoad()
        progressView.backgroundColor = Constants.Colors.bgLightGrey
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("Second VC will appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("Second VC will disappear")
    }
    
    // Returns the number of elements
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.decks.count
    }
    
    
    
    // Creating the custom cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("pCell", forIndexPath: indexPath) as! ProgressViewCell
    
        
        cell.layer.cornerRadius = 6
        cell.imageView?.layer.cornerRadius = 6
        cell.imageView?.image =  self.decks[indexPath.row]
        cell.deckName?.text = self.names[indexPath.row]
        cell.deckName?.font = UIFont(name: "Helvetica Neue", size: 24)
        
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
