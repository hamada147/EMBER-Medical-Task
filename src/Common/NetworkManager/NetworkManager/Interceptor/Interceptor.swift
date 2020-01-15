//
//  Interceptor.swift
//  NetworkManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public protocol Interceptor {
    func intercept(request: URLRequest) -> URLRequest
    func intercept(response: URLResponse, data: Data) -> Data?
}
