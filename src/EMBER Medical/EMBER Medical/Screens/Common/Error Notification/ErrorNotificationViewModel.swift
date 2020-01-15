//
//  ErrorNotificationViewModel.swift
//  EMBER Medical
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import Foundation

class ErrorNotificationViewModel: BaseViewModel {
    let errorTitle, errorContent, actionBtnTitle, dismissBtnTitle: String
    
    init(errorTitle: String, errorContent: String, actionBtnTitle: String = "Action", dismissBtnTitle: String = "Dismiss") {
        self.errorTitle = errorTitle
        self.errorContent = errorContent
        self.actionBtnTitle = actionBtnTitle
        self.dismissBtnTitle = dismissBtnTitle
    }
}
