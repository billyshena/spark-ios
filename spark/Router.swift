//
//  Router.swift
//  spark
//
//  Created by Billy Shen on 02/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//


import Alamofire

enum Router: URLRequestConvertible {
    
    static let baseURLString = Constants.APIConstants.kApiApplicationBaseUrl
    
    case PostUserFromFacebook(String)
    case GetUser(Int)
    case UpdateUser(Int, User)
    case GetAlbums()
    case GetPhotosAlbum(Int)
    case PostPhoto(String, Int, String)
    case GetPhotos(Int)
    
    var method: Alamofire.Method {
        switch self {
        case .PostUserFromFacebook:
            return .POST
        case .GetUser:
            return .GET
        case .UpdateUser:
            return .PUT
        case .GetAlbums:
            return .GET
        case .GetPhotosAlbum(_):
            return .GET
        case .PostPhoto(_,_,_):
            return .POST
        case .GetPhotos(_):
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .PostUserFromFacebook(_):
            return "/auth/facebook"
        case .GetUser(let id):
            return "/user/\(id)"
        case .UpdateUser(let id, _):
            return "/user/\(id)"
        case .GetAlbums():
            return "/user/albums"
        case .GetPhotosAlbum(_):
            return "/user/pictures"
        case .PostPhoto(_,_,_),
        .GetPhotos(_):
            return "/picture"
        }
    }
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: Router.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        
        switch self {
        case .PostUserFromFacebook(let tokenFB):
            var params = [String: AnyObject]()
            params = ["accessToken": tokenFB]
            
            return ParameterEncoding.URL.encode(mutableURLRequest, parameters: params).0
            
        case .GetUser(_):
            if let token = Session.sessionInfos().userAuthToken {
                mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            }
            
            return ParameterEncoding.URL.encode(mutableURLRequest, parameters: nil).0
            
        case .UpdateUser(_, let user):
            if let token = Session.sessionInfos().userAuthToken {
                mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            }
            
            var params = [String: AnyObject]()
            params = ["firstName": user.first_name, "lastName": user.last_name, "email": user.email, "birthday": user.birthday, "gender": user.gender, "location": user.location, "phone": user.phone]
            
            return ParameterEncoding.URL.encode(mutableURLRequest, parameters: params).0
            
        case .GetAlbums():
            //            if let token = Session.sessionInfos().userAuthToken {
            //                mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            //            }
            var params = [String: AnyObject]()
            if let tokenFB = Session.sessionInfos().userFacebookToken {
                params = ["accessToken": tokenFB]
            }
            
            return ParameterEncoding.URL.encode(mutableURLRequest, parameters: params).0
            
        case .GetPhotosAlbum(let albumID):
            var params = [String: AnyObject]()
            if let tokenFB = Session.sessionInfos().userFacebookToken {
                params = ["accessToken": tokenFB, "albumId": albumID]
            }
            
            return ParameterEncoding.URL.encode(mutableURLRequest, parameters: params).0
            
        case .PostPhoto(let url, let position, let category):
            if let token = Session.sessionInfos().userAuthToken {
                mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "authorization")
            }
            
            var params = [String: AnyObject]()
            if let tokenFB = Session.sessionInfos().userFacebookToken, let ownerId = Session.sessionInfos().userId {
                params = ["accessToken": tokenFB, "owner": ownerId]
            }
            params = ["url": url, "category": category, "position": position]
            
            return ParameterEncoding.URL.encode(mutableURLRequest, parameters: params).0
            
        case .GetPhotos(let ownerId):
            var params = [String: AnyObject]()
            params = ["owner": ownerId]
            
            return ParameterEncoding.URL.encode(mutableURLRequest, parameters: params).0
        }
    }
    
    func performRequest(completionHandler: (AnyObject?, AppError?) -> Void) {
        request(self).responseJSON { (req, response, result) -> Void in
            switch result {
            case .Failure(_,_):
                completionHandler(nil, AppError.Unknown)
            case .Success(let json):
                if let responseURL = response {
                    switch responseURL.statusCode {
                    case 200:
                        completionHandler(json, nil)
                    case 201:
                        completionHandler(json, nil)
                    case 500:
                        completionHandler(nil, AppError.ServerError)
                    default:
                        print(responseURL)
                        print("WARNING : status code \(responseURL.statusCode) not handled")
                        completionHandler(nil, AppError.Unknown)
                    }
                }
            }
        }
    }
    
}