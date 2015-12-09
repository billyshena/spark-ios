//
//  Constants.swift
//  spark
//
//  Created by Billy Shen on 02/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit

struct Constants {
    
    struct Constants {
        static let kNumberAppPhotos = 8
    }
    
    struct APIConstants {
        static let kApiApplicationBaseUrl = "http://cocomodel.scalingo.io"
    }
    
    struct UserDefaults {
        static let UserIDKey = "userId"
        static let UserAuthTokenKey = "authToken"
        static let UserFacebookTokenKey = "facebookToken"
    }
    
    struct Colors {
        
        static let bgLightGrey = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        static let cardBorder = UIColor(red:0.88, green:0.91, blue:0.93, alpha:1.0).CGColor
    
    }
    

}
