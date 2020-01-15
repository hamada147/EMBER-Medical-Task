//
//  GetTopHeadlinesRequest.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public class GetTopHeadlinesRequest: BaseArticleRequest {
    public var country: Country?
    public var category: Category?
    // Note: you can't mix this param with the country or category params.
    // sources
    // 20 is the default, 100 is the maximum
    public var pageSize: Int = 20
    public var page: Int = 1
    
    public init(sources: String?, q: String?, country: Country?, category: Category?, pageSize: Int = 20, page: Int = 1) {
        self.country = country
        self.category = category
        self.pageSize = pageSize
        self.page = page
        super.init(sources: sources, q: q)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    public static func == (lhs: GetTopHeadlinesRequest, rhs: GetTopHeadlinesRequest) -> Bool {
        if (lhs.q == rhs.q && lhs.sources == rhs.sources && lhs.country == rhs.country && lhs.category == rhs.category && lhs.pageSize == rhs.pageSize && lhs.page == rhs.page) {
          return true
        } else {
            return false
        }
    }
}
