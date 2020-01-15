//
//  URLSessionMock.swift
//  NetworkManagerTests
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

class URLSessionMock: URLSession {
    var lastURL: URL!
    var nextDataTask = URLSessionDataTaskMock()
    var nextData: Data?
    var nextError: URLError?
    var nextResponse: URLResponse?
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastURL = request.url
        completionHandler(nextData, nextResponse, nextError)
        return nextDataTask
    }
    
    override init() {}
}
