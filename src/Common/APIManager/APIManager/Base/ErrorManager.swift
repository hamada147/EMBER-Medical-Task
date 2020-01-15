//
//  ErrorManager.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public class ErrorManager {
    static func handleURLError(error: URLError) -> InAPPError {
        switch error.errorCode {
        case -1001:
            return InAPPError(errorCode: 1000, subErrorCode: 1, errorMessage: "The request timed out.")
        default:
            return InAPPError(errorCode: 9999, subErrorCode: 1, errorMessage: error.localizedDescription)
        }
    }
}
