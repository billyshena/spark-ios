//
//  FBManager.swift
//  spark
//
//  Created by Billy Shen on 02/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import SwiftyJSON
import FBSDKLoginKit

public class FBManager {
    
    static func openSessionWithFacebook(completionHandler : (String?, AppError?) -> Void) -> Void {
        let loginManager = FBSDKLoginManager()
        loginManager.logInWithReadPermissions(["public_profile", "email"], fromViewController: nil) { (result, error) -> Void in
            if (error != nil) {
                print("Error")
            }
            else if result.isCancelled {
                print("Cancelled")
            }
            else {
                let facebookToken = FBSDKAccessToken.currentAccessToken().tokenString
                print("facebookToken", facebookToken)
                completionHandler(facebookToken, nil)
            }
        }
    }
    
}

