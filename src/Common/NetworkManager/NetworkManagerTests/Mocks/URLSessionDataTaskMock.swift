//
//  URLSessionDataTaskMock.swift
//  NetworkManagerTests
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

class URLSessionDataTaskMock: URLSessionDataTask {
    var resumeIsCalled: Bool = false
    override func resume() {
        self.resumeIsCalled = true
    }
}
