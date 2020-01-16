//
//  AppConfig.swift
//  EMBER Medical
//
//  Created by Ahmed Moussa on 1/16/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import UIKit.UIViewController

public class AppConfig {
    public static func runRootViewController() {
        RoutersManager.activateRouter(routerType: .News, parentView: nil)
    }
}
