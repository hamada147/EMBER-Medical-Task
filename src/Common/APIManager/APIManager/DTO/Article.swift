//
//  Article.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public class Article: Codable, Equatable {
    
    public let source: Source
    public let title, articleDescription, url, publishedAt, urlToImage: String
    public let author, content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title, url, urlToImage, publishedAt, content
        case articleDescription = "description"
    }

    public init(source: Source, author: String?, title: String, articleDescription: String, url: String, urlToImage: String, publishedAt: String, content: String?) {
        self.source = source
        self.author = author
        self.title = title
        self.articleDescription = articleDescription
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    public static func == (lhs: Article, rhs: Article) -> Bool {
        if (lhs.source == rhs.source && lhs.title == rhs.title && lhs.articleDescription == rhs.articleDescription && lhs.url == rhs.url && lhs.publishedAt == rhs.publishedAt && lhs.urlToImage == rhs.urlToImage && lhs.author == rhs.author && lhs.content == rhs.content) {
            return true
        } else {
            return false
        }
    }
}
