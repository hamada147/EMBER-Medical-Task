//
//  RequestConfig.swift
//  NetworkManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public struct RequestConfig {
    public var httpMethod: HTTPMethod
    public var allHTTPHeaderFields: [String : String]?
    
    public init (httpMethod: HTTPMethod, allHTTPHeaderFields:[String : String]?) {
        self.httpMethod = httpMethod
        self.allHTTPHeaderFields = allHTTPHeaderFields
    }
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
