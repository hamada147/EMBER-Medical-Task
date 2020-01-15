//
//  GetSourcesAPI.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation
import NetworkManager

public class GetSourcesAPI: BaseAPI<EmptyDTO, SourcesResponse, APIErrorDTO> {
    
    var language: Language?
    var country: Country?
    
    override var httpMethod: HTTPMethod { return .get }
    
    override var relativeApiPath: String {
        var apiPath = "sources"
        if self.language == nil && self.country == nil {
             return apiPath
        } else {
            apiPath = "\(apiPath)?"
        }
        if (self.language != nil) {
            apiPath = "\(apiPath)language=\(self.language!)&&"
        }
        if (self.country != nil) {
            apiPath = "\(apiPath)country=\(self.country!)&&"
        }
        return apiPath
    }
}
