//
//  APIManagerConfig.swift
//  APIManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation
import Obfuscator

public class APIManagerConfig {
    public static var serverUrl: URL? {
        let key: [UInt8] = [39, 22, 18, 5, 0, 89, 78, 91, 1, 23, 57, 32, 46, 18, 3, 75, 12, 6, 40, 77, 16, 71, 92]
        let obf = Obfuscator()
        return URL(string: obf.reveal(key: key))
    }
    
    public static var apiToken: String {
        let key: [UInt8] = [125, 3, 5, 22, 22, 86, 80, 71, 88, 75, 122, 102, 123, 0, 89, 93, 1, 65, 120, 1, 83, 23, 67, 80, 82, 21, 9, 71, 42, 102, 118, 3]
        let obf = Obfuscator()
        return obf.reveal(key: key)
    }
    
    public static var apiDateFormat: String {
        return "yyyy/mm/dd"
    }
}
