//
//  ErrorNotificationViewController.swift
//  EMBER Medical
//
//  Created by Ahmed Moussa on 1/15/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import UIKit.UIImageView
import UIKit.UILabel

@objc public protocol NotificationDelegation {
    @objc optional func takeAction()
    @objc optional func dimissNotification()
}

class ErrorNotificationViewController: BaseViewController {

    // MARK:- Outlets
    @IBOutlet weak var errorImage: UIImageView!
    @IBOutlet weak var errorTitleLbl: UILabel!
    @IBOutlet weak var errorContentLbl: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var takeActionButton: UIButton!
    
    // MARK:- Delegation (NotificationDelegation)
    var delegate: NotificationDelegation?
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLocalization()
    }
    
    // MARK:- Utils
    func setLocalization() {
        self.errorTitleLbl.text = self.vm.errorTitle
        self.errorContentLbl.text = self.vm.errorContent
    }
    
    // MARK:- View Model (ErrorNotificationViewModel)
    var vm: ErrorNotificationViewModel {
        return self.viewModel as! ErrorNotificationViewModel
    }
    
    // MARK:- Actions
    @IBAction func dismissButtonClicked(_ sender: UIButton) {
        if self.delegate == nil {
            self.dismiss(animated: true, completion: nil)
        } else {
            guard let _ = self.delegate!.dimissNotification else {
                self.dismiss(animated: true, completion: nil)
                return
            }
            self.delegate!.dimissNotification!()
        }
    }
    
    @IBAction func takeActionButtonClicked(_ sender: UIButton) {
        if self.delegate == nil {
            self.dismiss(animated: true, completion: nil)
        } else {
            guard let _ = self.delegate!.takeAction else {
                self.dismiss(animated: true, completion: nil)
                return
            }
            self.delegate!.takeAction!()
        }
    }
}
