//
//  SingleDeckViewController.swift
//  spark
//
//  Created by Billy Shen on 08/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit

class SingleDeckViewController: UIViewController {
    
    @IBOutlet weak var singleImage: UIImageView!
    @IBOutlet weak var text: UILabel!
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.singleImage.image = self.image

        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.translucent = true
        navigationController?.view.backgroundColor = UIColor.clearColor()
        

//        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.view, style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        
        let btn = UIButton()
        btn.setImage(UIImage(named: "back"), forState: .Normal)
        btn.frame = CGRectMake(0, 0, 12, 20)
        btn.addTarget(self, action: "back:", forControlEvents: .TouchUpInside)
        let button = UIBarButtonItem(customView: btn)
        self.navigationItem.leftBarButtonItem = button
        
        



    }
    
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
