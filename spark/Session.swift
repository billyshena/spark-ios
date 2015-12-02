//
//  Session.swift
//  spark
//
//  Created by Billy Shen on 02/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import Alamofire
import SwiftyJSON

public class Session {
    
    public var id = 0
    public var tokenAPI = ""
    
}

extension Session {
    
    func fillWithDict(hash: JSON) {
        id = hash["id"].intValue
        
        if hash["hash"].object as? String != nil {
            tokenAPI = hash["hash"].stringValue
        }
    }
    
    class func createSessionFromJSON(hash: JSON) -> Session? {
        if hash.type == .Dictionary {
            let session = Session()
            session.fillWithDict(hash["token"])
            
            return session
        }
        else {
            return nil
        }
    }
    
    enum AccessType {
        case None
        case FullAccess
    }
    
    class var accessType: AccessType {
        get {
            switch(sessionInfos()) {
            case (let userId, let userAuthToken, let userFacebookToken) where userId != nil && userAuthToken != nil && userFacebookToken != nil:
                return .FullAccess
            default:
                return .None
            }
        }
    }
    
    class func openFullSession(userID: Int, authToken:String, facebookToken:String) {
        closeSession()
        
        NSUserDefaults.standardUserDefaults().setObject(userID, forKey: Constants.UserDefaults.UserIDKey)
        NSUserDefaults.standardUserDefaults().setObject(authToken, forKey: Constants.UserDefaults.UserAuthTokenKey)
        NSUserDefaults.standardUserDefaults().setObject(facebookToken, forKey: Constants.UserDefaults.UserFacebookTokenKey)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    //Close session
    class func closeSession() {
        NSUserDefaults.standardUserDefaults().removeObjectForKey(Constants.UserDefaults.UserIDKey)
        NSUserDefaults.standardUserDefaults().removeObjectForKey(Constants.UserDefaults.UserAuthTokenKey)
        NSUserDefaults.standardUserDefaults().removeObjectForKey(Constants.UserDefaults.UserFacebookTokenKey)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    //Get session infos
    class func sessionInfos() -> (userId: Int?, userAuthToken: String?, userFacebookToken: String?) {
        return (NSUserDefaults.standardUserDefaults().objectForKey(Constants.UserDefaults.UserIDKey) as! Int?, NSUserDefaults.standardUserDefaults().objectForKey(Constants.UserDefaults.UserAuthTokenKey) as! String?,NSUserDefaults.standardUserDefaults().objectForKey(Constants.UserDefaults.UserFacebookTokenKey) as! String?)
    }
    

    
}