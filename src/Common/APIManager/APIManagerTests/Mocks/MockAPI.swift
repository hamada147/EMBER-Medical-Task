//
//  MockAPI.swift
//  APIManagerTests
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation
@testable import APIManager

class MockAPI: BaseAPI<EmptyDTO, EmptyDTO, EmptyDTO> {
    var testSession: URLSession?
    override var relativeApiPath: String {
        return "api/"
    }
}
