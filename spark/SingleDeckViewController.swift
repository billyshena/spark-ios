//
//  SingleDeckViewController.swift
//  spark
//
//  Created by Billy Shen on 08/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit

class SingleDeckViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationController?.navigationBar.shadowImage = UIImage()
   
        
        let image = UIImage(named: "logo.png")
        navigationItem.titleView = UIImageView(image: image)
        self.view.backgroundColor = UIColor.lightGrayColor()


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
