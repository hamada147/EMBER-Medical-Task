//
//  RoutersManager.swift
//  EMBER Medical
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation
import UIKit.UIViewController

public enum RouterType: Int {
    case News
}

public class RoutersManager {
    // MARK:- Atributes
    static var activeRouter : Router?
    
    // MARK:- Activite Router
    public static func activateRouter(routerType: RouterType, parentView: UIViewController?) {
        switch routerType {
        case .News:
            RoutersManager.activeRouter = NewsRouter(parentView: parentView)
            self.activeRouter!.start()
        }
    }
}
