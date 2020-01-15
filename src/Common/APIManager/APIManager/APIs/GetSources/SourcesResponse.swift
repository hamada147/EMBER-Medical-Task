//
//  SourcesResponse.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public class SourcesResponse: BaseResponse {
    public let sources: [Source]

    public init(status: String, sources: [Source]) {
        self.sources = sources
        super.init(status: status)
    }
    
    required public init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    public static func == (lhs: SourcesResponse, rhs: SourcesResponse) -> Bool {
        if (lhs.status == rhs.status && lhs.sources.count == rhs.sources.count) {
            for item in lhs.sources {
                if (!rhs.sources.contains(item)) {
                    return false
                }
            }
            return true
        } else {
            return false
        }
    }
}
