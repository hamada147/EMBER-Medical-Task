//
//  URLSessionDataTaskMock.swift
//  APIManagerTests
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

class URLSessionDataTaskMock: URLSessionDataTask {
    var resumeIsCalled = false
    
    override func resume() {
        self.resumeIsCalled = true
    }
    
    override init() {}
}
