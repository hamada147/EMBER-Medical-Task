//
//  Source.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public class Source: Codable, Equatable {
    public let name: String
    public let id, sourceDescription, url: String?
    public let language: Language?
    public let country: Country?
    public let category: Category?

    enum CodingKeys: String, CodingKey {
        case id, name, url, category, language, country
        case sourceDescription = "description"
    }

    public init(id: String, name: String, sourceDescription: String?, url: String?, category: Category?, language: Language?, country: Country?) {
        self.id = id
        self.name = name
        self.sourceDescription = sourceDescription
        self.url = url
        self.category = category
        self.language = language
        self.country = country
    }
    
    public static func == (lhs: Source, rhs: Source) -> Bool {
        if (lhs.id == rhs.id && lhs.name == rhs.name && lhs.sourceDescription == rhs.sourceDescription && lhs.url == rhs.url && lhs.category == rhs.category && lhs.language == rhs.language && lhs.country == rhs.country) {
            return true
        } else {
            return false
        }
    }
}
