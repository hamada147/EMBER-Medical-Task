//
//  GetEverythingRequest.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public class GetEverythingRequest: BaseArticleRequest {
    // Keywords or phrases to search for in the article title only.
    public var qInTitle: String?
    
    public init(q: String?, sources: String?, qInTitle: String?) {
        self.qInTitle = qInTitle
        super.init(sources: sources, q: q)
    }
    
    required public init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    public static func == (lhs: GetEverythingRequest, rhs: GetEverythingRequest) -> Bool {
        if (lhs.q == rhs.q && lhs.sources == rhs.sources && lhs.qInTitle == rhs.qInTitle) {
            return true
        } else {
            return false
        }
    }
}
