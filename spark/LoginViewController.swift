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
        
        print("Hello I'm pressed")
        User.openSession { (connected, appError) -> Void in
            // Récupère les infos user depuis l'API
            if let userId = Session.sessionInfos().userId {
                User.getUser(userId, completionHandler: { (user, appError) -> Void in
                    print("user", user)
                    if let _ = user {
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewControllerWithIdentifier("SWRevealViewController") as! SWRevealViewController
                        self.presentViewController(vc, animated: true, completion: nil)
                        //let homeViewController = self.storyboard?.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
                        
                        
                        //print("viewController", homeViewController)
                        
                        //self.presentViewController(homeViewController, animated: true, completion: nil)
                        
                        //AppDelegate.changeRootViewController(homeViewController, animated: true)
                    }
                })
            }
        }
    }



}
