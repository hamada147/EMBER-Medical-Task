//
//  GetTopHeadlinesRequest.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public class GetTopHeadlinesRequest: Codable, Equatable {
    var country: Country?
    var category: Category?
    // A comma-seperated string of identifiers for the news sources or blogs you want headlines from.
    // Note: you can't mix this param with the country or category params.
    var sources: String?
    var q: String?
    // 20 is the default, 100 is the maximum
    var pageSize: Int = 20
    var page: Int = 1
    
    public init(country: Country?, category: Category?, sources: String?, q: String?, pageSize: Int = 20, page: Int = 1) {
        self.country = country
        self.category = category
        self.sources = sources
        self.q = q
        self.pageSize = pageSize
        self.page = page
    }
    
    public static func == (lhs: GetTopHeadlinesRequest, rhs: GetTopHeadlinesRequest) -> Bool {
        if (lhs.country == rhs.country && lhs.category == rhs.category && lhs.sources == rhs.sources && lhs.q == rhs.q && lhs.pageSize == rhs.pageSize && lhs.page == rhs.page) {
          return true
        } else {
            return false
        }
    }
}
