//
//  TestViewController.swift
//  spark
//
//  Created by Billy Shen on 03/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit


class TestViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    
    let apple = ["Apple", "banana"]
    override func viewDidLoad() {
        
        print("TesViewController")
        super.viewDidLoad()
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 8
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print("indexPath", indexPath.row)
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("testCell", forIndexPath: indexPath) as! UICollectionViewCell
        
        return cell
    }
    

    
    

    
    
    
}