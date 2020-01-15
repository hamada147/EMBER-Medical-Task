//
//  EmptyDTO.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public struct EmptyDTO: Codable, Equatable {
    
    public init() {}
    
    public static func == (lhs: EmptyDTO, rhs: EmptyDTO) -> Bool {
        return true
    }
}
