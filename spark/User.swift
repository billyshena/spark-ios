//
//  User.swift
//  CocoModel
//
//  Created by Billy Shen on 02/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import Alamofire
import SwiftyJSON
import RealmSwift

public class User: Object {
    
    public var id = 0
    public var first_name = ""
    public var last_name = ""
    public var full_name = ""
    public var facebookID = ""
    public var gender = ""
    public var email = ""
    public var avatar = ""
    public var birthday = ""
    public var cover = ""
    public var locale = ""
    public var location = ""
    public var phone = ""
    
    
    override public class func primaryKey() -> String {
        return "id"
    }
}


extension User {
    
    func fillWithDict(hash: JSON) {
        id = hash["id"].intValue
        
        if hash["firstName"].object as? String != nil {
            first_name = hash["firstName"].stringValue
        }
        
        if hash["lastName"].object as? String != nil {
            last_name = hash["lastName"].stringValue
        }

        
        if hash["facebookID"].object as? String != nil {
            facebookID = hash["facebookID"].stringValue
        }
        
        if hash["email"].object as? String != nil {
            email = hash["email"].stringValue
        }
        
        if hash["gender"].object as? String != nil {
            gender = hash["gender"].stringValue
        }
        
        if hash["avatar"].object as? String != nil {
            avatar = hash["avatar"].stringValue
        }
        
        if hash["birthday"].object as? String != nil {
            birthday = hash["birthday"].stringValue
        }
        
        if hash["gender"].object as? String != nil {
            gender = hash["gender"].stringValue
        }
        
        if hash["locale"].object as? String != nil {
            locale = hash["locale"].stringValue
        }
        
        if hash["location"].object as? String != nil {
            location = hash["location"].stringValue
        }
        
        if hash["phone"].object as? String != nil {
            phone = hash["phone"].stringValue
        }
        
    }
    
    class func createUserFromJSON(hash: JSON, persist: Bool) -> User? {
        if hash.type == .Dictionary {
            let user = User()
            user.fillWithDict(hash)
            
            if persist {
                saveUserInRealm(user)
            }
            
            return user
        }
        else {
            return nil
        }
    }
    
}

extension User {
    
    static func openSession(completionHandler: (Bool?, AppError?) -> Void) -> Void {
        FBManager.openSessionWithFacebook { (token, appError) -> Void in
            if let tokenFB = token {
                connectUser(tokenFB, completionHandler: { (completed, appError) -> Void in
                    if let completedConnection = completed {
                        completionHandler(completedConnection, nil)
                    }
                    else {
                        completionHandler(nil, appError)
                    }
                })
            }
        }
    }
    
    static func connectUser(tokenFB: String, completionHandler: (Bool?, AppError?) -> Void) -> Void {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        Router.PostUserFromFacebook(tokenFB).performRequest { (json, error) in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            if let error = error {
                completionHandler(nil, error)
            }
            else if let json: AnyObject = json {
                let json = JSON(json)
                if json.type == .Dictionary {
                    let session = Session.createSessionFromJSON(json)
                    if let sessionFilled = session {
                        Session.openFullSession(sessionFilled.id, authToken: sessionFilled.tokenAPI, facebookToken: tokenFB)
                        completionHandler(true, nil)
                    }
                    else {
                        completionHandler(nil, error)
                    }
                }
            }
        }
    }
    
    static func getUser(id: Int, completionHandler: (User?, AppError?) -> Void) -> Void {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        Router.GetUser(id).performRequest { (json, error) in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            if let error = error {
                completionHandler(nil, error)
            }
            else if let json: AnyObject = json {
                let json = JSON(json)
                if json.type == .Dictionary {
                    let user = User.createUserFromJSON(json, persist: true)
                    if let userFilled = user {
                        completionHandler(userFilled, nil)
                    }
                    else {
                        completionHandler(nil, .Unknown)
                    }
                }
            }
        }
    }
    
    static func updateUser(user: User, completionHandler: (User?, AppError?) -> Void) -> Void {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        Router.UpdateUser(user.id, user).performRequest { (json, error) in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            if let error = error {
                completionHandler(nil, error)
            }
            else if let json: AnyObject = json {
                let json = JSON(json)
                if json.type == .Dictionary {
                    let user = User.createUserFromJSON(json, persist: true)
                    if let userFilled = user {
                        completionHandler(userFilled, nil)
                    }
                    else {
                        completionHandler(nil, .Unknown)
                    }
                }
            }
        }
    }
    
    static func getUserCurrentFromRealm() -> User? {
        var users: Results<User>!
        users = try! Realm().objects(User)
        var user = User()
        if (users != nil) {
            user = users[0]
            
            return user
        }
        return nil
    }
    
    static func removeUserRealm() {
        let realm = try! Realm()
        if let id = Session.sessionInfos().userId {
            let user = realm.objects(User).filter("id = \(id)")
            try! realm.write {
                realm.delete(user)
            }
        }
        
    }
    
    static func saveUserInRealm(user: User) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(user, update: true)
        }
    }
    
}
