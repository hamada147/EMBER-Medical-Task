//
//  GetTopHeadlinesAPI.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation
import NetworkManager

public class GetTopHeadlinesAPI: BaseAPI<GetTopHeadlinesRequest, GetTopHeadlinesResponse, EmptyDTO> {
    
    override var httpMethod: HTTPMethod { return .get }
    
    override var relativeApiPath: String {
        return "top-headlines"
    }
}
