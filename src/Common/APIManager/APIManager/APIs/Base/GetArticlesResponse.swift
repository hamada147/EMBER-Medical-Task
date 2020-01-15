//
//  GetArticlesResponse.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public class GetArticlesResponse: BaseResponse {
    public let totalResults: Int
    public let articles: [Article]

    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    public init(status: String, totalResults: Int, articles: [Article]) {
        self.totalResults = totalResults
        self.articles = articles
        super.init(status: status)
    }
    
    public static func == (lhs: GetArticlesResponse, rhs: GetArticlesResponse) -> Bool {
        if (lhs.status == rhs.status && lhs.totalResults == rhs.totalResults && lhs.articles.count == rhs.articles.count) {
            for item in lhs.articles {
                if (!rhs.articles.contains(item)) {
                    return false
                }
            }
            return true
        } else {
            return false
        }
    }
}
