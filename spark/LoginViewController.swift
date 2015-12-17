//
//  LoginViewController.swift
//  spark
//
//  Created by Billy Shen on 02/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit
import SafariServices
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: UIViewController {

    @IBOutlet weak var fbLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        fbLogin.layer.cornerRadius = 5
   
        if (FBSDKAccessToken.currentAccessToken() == nil)
        {
            print("Not logged in..")
        }
        else
        {
            print("Logged in..")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func connectFb(sender: UIButton) {
      
        User.openSession { (connected, appError) -> Void in
            // Récupère les infos user depuis l'API
            if let userId = Session.sessionInfos().userId {
                User.getUser(userId, completionHandler: { (user, appError) -> Void in
    
                    print("user", user)
                    if let _ = user {
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewControllerWithIdentifier("SWRevealViewController") as! SWRevealViewController
                        
                        AppDelegate.changeRootViewController(vc, animated: true)
                    }
                })
            }
        }
    }



}
