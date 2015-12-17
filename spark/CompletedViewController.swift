//
//  CompletedViewController.swift
//  spark
//
//  Created by Billy Shen on 14/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit

class CompletedViewController: UIViewController {


    override func viewDidLoad() {
        
        print("CompletedViewController")
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("Third VC will appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("Third VC will disappear")
    }
    
}
