//
//  ProgressViewController.swift
//  spark
//
//  Created by Billy Shen on 14/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    
    
    override func viewDidLoad() {
        
        print("ProgressViewController")
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("Second VC will appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("Second VC will disappear")
    }

}
