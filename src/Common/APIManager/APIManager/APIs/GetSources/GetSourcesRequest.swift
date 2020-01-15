//
//  GetSourcesRequest.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public class GetSourcesRequest: Codable, Equatable {
    public var language: Language?
    public var country: Country?
    
    public init(language: Language?, country: Country?) {
        self.language = language
        self.country = country
    }
    
    public static func == (lhs: GetSourcesRequest, rhs: GetSourcesRequest) -> Bool {
        if (lhs.language == rhs.language && lhs.country == rhs.country) {
            return true
        } else {
            return false
        }
    }
}
