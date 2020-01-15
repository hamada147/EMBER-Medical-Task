//
//  GetEverythingRequest.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public class GetEverythingRequest: Codable, Equatable {
    // Keywords or phrases to search for in the article title and body.
    public var q: String?
    // Keywords or phrases to search for in the article title only.
    public var qInTitle: String?
    // A comma-seperated string of identifiers for the news sources or blogs you want headlines from.
    public var sources: String?
    
    public init(q: String?, qInTitle: String?, sources: String?) {
        self.q = q
        self.qInTitle = qInTitle
        self.sources = sources
    }
    
    public static func == (lhs: GetEverythingRequest, rhs: GetEverythingRequest) -> Bool {
        if (lhs.q == rhs.q && lhs.qInTitle == rhs.qInTitle && lhs.sources == rhs.sources) {
            return true
        } else {
            return false
        }
    }
}
