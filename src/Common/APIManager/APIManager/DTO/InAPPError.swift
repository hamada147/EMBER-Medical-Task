//
//  InAPPError.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public struct InAPPError: Codable, Equatable {
    public let errorCode, subErrorCode: Int
    public let errorMessage: String
    
    init(errorCode: Int, subErrorCode: Int, errorMessage: String) {
        self.errorCode = errorCode
        self.subErrorCode = subErrorCode
        self.errorMessage = errorMessage
    }
    
    public static func == (lhs: InAPPError, rhs: InAPPError) -> Bool{
        if (lhs.errorCode == rhs.errorCode && lhs.subErrorCode == rhs.subErrorCode && lhs.errorMessage == rhs.errorMessage) {
            return true
        } else {
            return false
        }
    }
}
