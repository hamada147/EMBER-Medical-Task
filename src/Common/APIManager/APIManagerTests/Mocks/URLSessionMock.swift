//
//  URLSessionMock.swift
//  APIManagerTests
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

class URLSessionMock: URLSession {
    var lastCalledURL: URL!
    var data: Data?
    var responseData: URLResponse?
    var error: URLError?
    var sessionDataTask = URLSessionDataTaskMock()
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.lastCalledURL = request.url
        completionHandler(self.data, self.responseData, self.error)
        return self.sessionDataTask
    }
    
    override init() {}
}
