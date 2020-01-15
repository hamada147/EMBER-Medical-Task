//
//  BaseViewController.swift
//  EMBER Medical
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import UIKit.UIViewController
import APIManager

class BaseViewController: UIViewController, NotificationDelegation {
    
    // MARK:- Attributes
    var viewModel: BaseViewModel!
    var baseRouter: Router?
    
    // MARK:- Init
    public init(viewModel: BaseViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    public init(viewModel: BaseViewModel, baseRouter: Router) {
        self.viewModel = viewModel
        self.baseRouter = baseRouter
        super.init(nibName: nil, bundle: nil)
    }
    
    public override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK:- Keyboard scrolling handling
    final func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    final func unRegisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    // NOTE: override if needed
    @objc func keyboardWillShow(notification: Notification) {
    }
    
    // NOTE: override if needed
    @objc func keyboardDidHide(notification: Notification) {
    }
    
    // MARK:- Resign First Responder on Main View Click
    func setOnViewClick() {
        DispatchQueue.main.async {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.viewClicked(_:)))
            self.view.addGestureRecognizer(tap)
        }
    }
    
    // NOTE: override if needed
    @objc func viewClicked(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    // MARK:- Show Validations Errors
    func showValidationErrors(errors: [InAPPError]) {
        var errorContent = ""
        if (errors.count > 0) {
            for error in errors {
                errorContent += "\(error.errorMessage)\n"
            }
            self.baseRouter?.navigateToErrorNotification(currentViewController: self, withAnimation: true, title: "Validation Errors", content: errorContent)
        }
    }
}
