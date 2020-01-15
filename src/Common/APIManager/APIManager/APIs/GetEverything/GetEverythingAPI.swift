//
//  GetEverythingAPI.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation
import NetworkManager

public class GetEverythingAPI: BaseAPI<GetEverythingRequest, GetArticlesResponse, APIErrorDTO> {
    
    override var httpMethod: HTTPMethod { return .get }
    
    override var relativeApiPath: String {
        return "everything"
    }
}
