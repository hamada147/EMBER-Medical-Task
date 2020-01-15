//
//  NetworkManagerTests.swift
//  NetworkManagerTests
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import XCTest
@testable import NetworkManager

class NetworkManagerTests: XCTestCase {

    var requestExecuter: URLSessionRequestExecuter!
    let url = URL(string:"https://reqres.in/api/users?page=2")
    var config = RequestConfig(httpMethod: .get, allHTTPHeaderFields: nil)
    var paramEncoder = JSONParameterEncoder()
    let session = URLSessionMock()
    var actualData: Data?
    var actualResponse: URLResponse?
    var actualError: Error?
    
    override func setUp() {
        super.setUp()
        self.requestExecuter = URLSessionRequestExecuter(session: self.session, url: self.url!, requestConfig: self.config, parameters: nil, parameterEncoders: [self.paramEncoder], onComplete: { [weak self] data, response in
            self?.actualData = data
            self?.actualResponse = response
            }, onFailure: { [weak self] error  in
            self?.actualError = error
        })
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_execute_requestsTheURL() {
        self.session.nextResponse = HTTPURLResponse(url: self.url!, statusCode: 300, httpVersion: nil, headerFields: nil)
        self.requestExecuter.execute()
        XCTAssert(self.session.lastURL == self.url)
    }
    
    func test_execute_startsTheRequest() {
        let dataTask = URLSessionDataTaskMock()
        self.session.nextDataTask = dataTask
        self.session.nextResponse = HTTPURLResponse(url: self.url!, statusCode: 300, httpVersion: nil, headerFields: nil)
        self.requestExecuter.execute()
        XCTAssertTrue(dataTask.resumeIsCalled)
    }
    
    func test_execute_withResponseData_returnsTheData() {
        let expectedData = "{}".data(using: .utf8)
        self.session.nextData = expectedData
        self.session.nextResponse = HTTPURLResponse(url: self.url!, statusCode: 300, httpVersion: nil, headerFields: nil)
        self.requestExecuter.execute()
        XCTAssertEqual(self.actualData, expectedData)
    }
    
    func test_execute_withResponse_returnsTheResponse() {
        let expectedResponse = HTTPURLResponse(url: self.url!, statusCode: 300, httpVersion: nil, headerFields: nil)
        self.session.nextResponse = expectedResponse
        self.requestExecuter.execute()
        XCTAssertEqual(self.actualResponse, expectedResponse)
    }
    
    func test_encode2Parameters_with2Encoders() {
        let parameters1: Parameters = [
            "foo": [1,2,3],
            "bar": [
                "baz": "qux"
            ]
        ]
        let parameters2: Parameters = [
            "page": 2
        ]
        let url = URL(string:"https://reqres.in/api/users")!
        let config = RequestConfig(httpMethod: .post, allHTTPHeaderFields: nil)
        let paramEncoders: [ParameterEncoder] = [JSONParameterEncoder(), URLParameterEncoder(destination: .queryString)]
        let parameters: [Parameters] = [parameters1, parameters2]
        let session = URLSessionMock()
        let requestExecuter = URLSessionRequestExecuter(session: session, url: url, requestConfig: config, parameters: parameters, parameterEncoders: paramEncoders, onComplete: nil, onFailure: nil)
        let desiredURL = URL(string:"https://reqres.in/api/users?page=2")
        
        XCTAssertEqual(requestExecuter.request.httpBody, try! JSONSerialization.data(withJSONObject: parameters1, options: .prettyPrinted))
        XCTAssertEqual(requestExecuter.request.url, desiredURL)
    }
    
    func test_encodeParameters_JSONEncoding(){
        let parameters: Parameters = [
            "foo": [1,2,3],
            "bar": [
                "baz": "qux"
            ]
        ]
        let url = URL(string:"https://reqres.in/api/users?page=2")
        let config = RequestConfig(httpMethod: .post, allHTTPHeaderFields: nil)
        let paramEncoder = JSONParameterEncoder()
        let session = URLSessionMock()
        let requestExecuter = URLSessionRequestExecuter(session: session, url: url!, requestConfig: config, parameters: [parameters], parameterEncoders: [paramEncoder], onComplete: nil, onFailure: nil)
        
        XCTAssertEqual(requestExecuter.request.httpBody, try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted))
    }
    
    func test_encodeParameters_URLEncoding(){
        let parameters: Parameters = [
            "foo": "foo"
        ]
        let url = URL(string:"https://reqres.in/api")
        let config = RequestConfig(httpMethod: .get, allHTTPHeaderFields: nil)
        let paramEncoder = URLParameterEncoder()
        let session = URLSessionMock()
        let requestExecuter = URLSessionRequestExecuter(session: session, url: url!, requestConfig: config, parameters: [parameters], parameterEncoders: [paramEncoder], onComplete: nil, onFailure: nil)
        let desiredURL = URL(string:"https://reqres.in/api?foo=foo")
        XCTAssertEqual(requestExecuter.request.url, desiredURL)
    }
}
