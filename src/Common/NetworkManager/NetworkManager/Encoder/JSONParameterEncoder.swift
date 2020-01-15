//
//  JSONParameterEncoder.swift
//  NetworkManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public class JSONParameterEncoder: ParameterEncoder {
    
    public init() {}
    
    public func encode(urlRequest: URLRequest, with parameters: Parameters) -> URLRequest {
        var urlRequestAfterEncoding = urlRequest
        if parameters.count > 0 {
            if JSONSerialization.isValidJSONObject(parameters) {
                urlRequestAfterEncoding.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            }
        }
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequestAfterEncoding.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        return urlRequestAfterEncoding
    }
}
