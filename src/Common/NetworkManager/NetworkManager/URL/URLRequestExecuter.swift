//
//  URLRequestExecuter.swift
//  NetworkManager
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

public typealias onComplete = (Data?, HTTPURLResponse) -> Void
public typealias onFailure = (URLError) -> Void

public protocol URLRequestExecuter {
    var url: URL { get set }
    var requestConfig: RequestConfig { get set }
    var onComplete: onComplete? { get set }
    var onFailure: onFailure? { get set }
    func execute()
    func executeSynchronous()
}
