//
//  APIErrorDTO.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public class APIErrorDTO: BaseResponse {
    public let code, message: String

    public init(status: String, code: String, message: String) {
        self.code = code
        self.message = message
        super.init(status: status)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    public static func == (lhs: APIErrorDTO, rhs: APIErrorDTO) -> Bool {
        if (lhs.status == rhs.status && lhs.code == rhs.code && lhs.message == rhs.message) {
            return true
        } else {
            return false
        }
    }
}
