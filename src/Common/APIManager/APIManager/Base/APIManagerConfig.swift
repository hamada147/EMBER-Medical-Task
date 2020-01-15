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
}
