//
//  AppError.swift
//  spark
//
//  Created by Billy Shen on 02/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import Foundation

enum AppError: Int {
    case FacebookError = 0,
    FacebookCancelled,
    AWSS3ErrorUpload,
    PostUser,
    Unknown,
    ServerError,
    NoError
    
    func toError() -> NSError {
        return NSError(domain:"SparkError", code: self.rawValue, userInfo: nil)
    }
}

extension AppError : ErrorType {
    var nsError: NSError {
        get {
            return toError()
        }
    }
}