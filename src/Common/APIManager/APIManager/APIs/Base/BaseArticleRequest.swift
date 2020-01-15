//
//  BaseArticleRequest.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public class BaseArticleRequest: Codable, Equatable {
    // A comma-seperated string of identifiers for the news sources or blogs you want headlines from.
    public var sources: String?
    // Keywords or phrases to search for in the article title and body.
    public var q: String?
    
    public init(sources: String?, q: String?) {
        self.sources = sources
        self.q = q
    }
    
    public static func == (lhs: BaseArticleRequest, rhs: BaseArticleRequest) -> Bool {
        if (lhs.sources == rhs.sources && lhs.q == rhs.q) {
          return true
        } else {
            return false
        }
    }
}
