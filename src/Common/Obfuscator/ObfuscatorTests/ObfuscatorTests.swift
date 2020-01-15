//
//  ObfuscatorTests.swift
//  ObfuscatorTests
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import XCTest
@testable import Obfuscator

class ObfuscatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_encryption() {
        let obf = Obfuscator.init()
        let expected: [UInt8] = [7, 7, 10, 25, 28, 67, 54, 27, 29, 30, 42]
        let restultToTest = obf.bytesByObfuscatingString(string: "Hello World")
        XCTAssert(restultToTest == expected)
    }
    
    func test_decryption() {
        let obf = Obfuscator.init()
        let expected: String = "Hello World"
        let key: [UInt8] = [7, 7, 10, 25, 28, 67, 54, 27, 29, 30, 42]
        let restultToTest = obf.reveal(key: key)
        XCTAssert(restultToTest == expected)
    }
}
