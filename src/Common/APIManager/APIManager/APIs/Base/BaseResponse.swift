//
//  BaseResponse.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public class BaseResponse: Codable, Equatable {
    public let status: String
    
    public init(status: String) {
        self.status = status
    }
    
    public static func == (lhs: BaseResponse, rhs: BaseResponse) -> Bool {
        if (lhs.status == rhs.status) {
            return true
        } else {
            return false
        }
    }
}
