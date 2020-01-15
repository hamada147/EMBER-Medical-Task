//
//  APIManagerTests.swift
//  APIManagerTests
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import XCTest
@testable import APIManager
import NetworkManager

class APIManagerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // MARK:- BaseAPI
    func test_BaseAPI_DoExecuteCalls_OnSuccess() {
        let expectation = self.expectation(description: "onSuccessCalled")
        let session = URLSessionMock()
        session.data = "{}".data(using: .utf8)
        session.responseData = HTTPURLResponse(url: URL(string: "http://192.168.1.120:8080")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        var onSuccessCalled = false
        let api = MockAPI(requestDTO: EmptyDTO(), onSuccess: { (responseDTO) in
            onSuccessCalled = true
            expectation.fulfill()
        }, onAPIError: nil, onConnectionError: nil, onParsingError: nil, paramEncoder: URLParameterEncoder(), session: session)
        api.testSession = session
        api.execute()
        
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertTrue(onSuccessCalled)
        }
    }
    
    func test_BaseAPI_DoExecuteCalls_OnAPIError() {
        let expectation = self.expectation(description: "OnAPIErrorCalled")
        let session = URLSessionMock()
        session.data = "{}".data(using: .utf8)
        session.responseData = HTTPURLResponse(url: URL(string: "http://192.168.1.120:8080")!, statusCode: 400, httpVersion: nil, headerFields: nil)
        var OnAPIErrorCalled = false
        let api = MockAPI(requestDTO: EmptyDTO(), onSuccess: nil, onAPIError: { (errorDTO) in
            OnAPIErrorCalled = true
            expectation.fulfill()
        }, onConnectionError: nil, onParsingError: nil, paramEncoder: URLParameterEncoder(), session: session)
        api.testSession = session
        api.execute()
        
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertTrue(OnAPIErrorCalled)
        }
    }
    
    func test_BaseAPI_DoExecuteCalls_OnConnectionError_401() {
        let expectation = self.expectation(description: "OnConnectionError")
        let session = URLSessionMock()
        session.data = "{}".data(using: .utf8)
        session.responseData = HTTPURLResponse(url: URL(string: "http://192.168.1.120:8080")!, statusCode: 401, httpVersion: nil, headerFields: nil)
        var OnConnectionError = false
        let api = MockAPI(requestDTO: EmptyDTO(), onSuccess: nil, onAPIError: nil, onConnectionError: { (errorDTO) in
            OnConnectionError = true
            expectation.fulfill()
        }, onParsingError: nil, paramEncoder: URLParameterEncoder(), session: session)
        api.testSession = session
        api.execute()
        
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertTrue(OnConnectionError)
        }
    }
    
    func test_BaseAPI_DoExecuteCalls_OnConnectionError_404() {
        let expectation = self.expectation(description: "OnConnectionError")
        let session = URLSessionMock()
        session.data = "{}".data(using: .utf8)
        session.responseData = HTTPURLResponse(url: URL(string: "http://192.168.1.120:8080")!, statusCode: 404, httpVersion: nil, headerFields: nil)
        var OnConnectionError = false
        let api = MockAPI(requestDTO: EmptyDTO(), onSuccess: nil, onAPIError: nil, onConnectionError: { (errorDTO) in
            OnConnectionError = true
            expectation.fulfill()
        }, onParsingError: nil, paramEncoder: URLParameterEncoder(), session: session)
        api.testSession = session
        api.execute()
        
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertTrue(OnConnectionError)
        }
    }
    
    func test_BaseAPI_DoExecuteCalls_OnConnectionError_429() {
        let expectation = self.expectation(description: "OnConnectionError")
        let session = URLSessionMock()
        session.data = "{}".data(using: .utf8)
        session.responseData = HTTPURLResponse(url: URL(string: "http://192.168.1.120:8080")!, statusCode: 429, httpVersion: nil, headerFields: nil)
        var OnConnectionError = false
        let api = MockAPI(requestDTO: EmptyDTO(), onSuccess: nil, onAPIError: nil, onConnectionError: { (errorDTO) in
            OnConnectionError = true
            expectation.fulfill()
        }, onParsingError: nil, paramEncoder: URLParameterEncoder(), session: session)
        api.testSession = session
        api.execute()
        
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertTrue(OnConnectionError)
        }
    }
    
    func test_BaseAPI_DoExecuteCalls_OnParsingError() {
        let expectation = self.expectation(description: "OnParsingErrorCalled")
        let session = URLSessionMock()
        session.data = "{\"hello\" \"world\"}".data(using: .utf8)
        session.responseData = HTTPURLResponse(url: URL(string: "http://192.168.1.120:8080")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        var OnParsingErrorCalled = false
        let api = MockAPI(requestDTO: EmptyDTO(), onSuccess: nil, onAPIError: nil, onConnectionError: nil, onParsingError: { (errorDTO) in
            OnParsingErrorCalled = true
            expectation.fulfill()
        }, paramEncoder: URLParameterEncoder(), session: session)
        api.testSession = session
        api.execute()
        
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertTrue(OnParsingErrorCalled)
        }
    }
    
    func test_BaseAPI_DoExecuteCalls_Fails() {
        let expectation = self.expectation(description: "onConnectionErrorCalled")
        let session = URLSessionMock()
        session.error = URLError(.badURL)
        var onConnectionErrorCalled = false
        let api = MockAPI(requestDTO: EmptyDTO(), onSuccess: nil, onAPIError: nil, onConnectionError: { (error) in
            onConnectionErrorCalled = true
            expectation.fulfill()
        }, onParsingError: nil, paramEncoder: URLParameterEncoder(), session: session)
        api.testSession = session
        api.execute()
        
        waitForExpectations(timeout: 5) { (error) in
            XCTAssertTrue(onConnectionErrorCalled)
        }
    }
}
