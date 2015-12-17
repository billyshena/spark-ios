//
//  SingleDeckViewController.swift
//  spark
//
//  Created by Billy Shen on 08/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit

class SingleDeckViewController: UIViewController {
    
    @IBOutlet weak var owner: UILabel!

    @IBOutlet weak var like: UILabel!
    @IBOutlet weak var deckName: UILabel!
    @IBOutlet weak var singleImage: UIImageView!
    @IBOutlet weak var separator: UIView!
    

    
    var image = UIImage()
    var text = ""
    var likeTxt = ""
    var ownerTxt = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.singleImage.image = self.image
        self.deckName.text = text
        
        self.like.alpha = 0.7
        self.owner.alpha = 0.7
        
        self.like.text = likeTxt
        self.owner.text = ownerTxt
        
        self.separator.layer.cornerRadius = self.separator.frame.size.width / 2
        self.separator.alpha = 0.7

        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.translucent = true
        navigationController?.view.backgroundColor = UIColor.clearColor()
        
    
        // Custom back navigation button
        let btn = UIButton()
        btn.setImage(UIImage(named: "back"), forState: .Normal)
        btn.frame = CGRectMake(0, 0, 12, 20)
        btn.addTarget(self, action: "back:", forControlEvents: .TouchUpInside)
        let button = UIBarButtonItem(customView: btn)
        self.navigationItem.leftBarButtonItem = button
        
    
        // Add event listener on start deck cta
//        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("imageTapped:"))
//        startDeck.userInteractionEnabled = true
//        startDeck.addGestureRecognizer(tapGestureRecognizer)
    
        
    }
    
    
//    func imageTapped(img: AnyObject) {
//        
//        print("Image is clicked here")
//        
//    }
//    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back(sender: UIBarButtonItem) {
        // Perform your custom actions
        // ...
        // Go back to the previous ViewController
        print("back")
        self.navigationController?.popViewControllerAnimated(true)
    }

    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
