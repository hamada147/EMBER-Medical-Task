//
//  Router.swift
//  EMBER Medical
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation
import UIKit.UIViewController

public protocol Router {
    var parentView: UIViewController? { get set }
    
    func start()
    func next(currentViewController: UIViewController)
    func back(currentViewController: UIViewController)
    func terminate(currentViewController: UIViewController, withAnimation: Bool)
    func navigateToErrorNotification(currentViewController: UIViewController, withAnimation: Bool, title: String, content: String)
}
