//
//  NewsRouter.swift
//  EMBER Medical
//
//  Created by Ahmed Moussa on 1/16/20.
//  Copyright © 2020 Ahmed Moussa. All rights reserved.
//

import UIKit.UIViewController
import UIKit.UINavigationController

class NewsRouter: Router {
    // MARK:- Varibles
    var parentView: UIViewController?
    let navigationController = UINavigationController()
    
    // MARK: init
    init(parentView: UIViewController?) {
        self.parentView = parentView
    }
    
    func start() {
        let vm = NewsListViewModel()
        let vc = NewsListViewController(viewModel: vm)
        
        DispatchQueue.main.async {
            self.navigationController.navigationBar.isHidden = true
            self.navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController.navigationBar.shadowImage = UIImage()
            self.navigationController.navigationBar.isTranslucent = false
            self.navigationController.navigationBar.isOpaque = false
            
            if (self.parentView != nil) {
                self.navigationController.viewControllers = [vc] as [UIViewController]
            }
            
            UIApplication.shared.windows.first?.rootViewController = self.navigationController
            
            // NOTE: This is the first NAV, No need to do a push unless you want to go to specific screen that don't exist in the navigationController viewControllers list
            if self.navigationController.viewControllers.firstIndex(of: vc) == nil {
                self.navigationController.pushViewController(vc, animated: true)
            }
        }
    }
    
    func next(currentViewController: UIViewController) {
        
    }
    
    func back(currentViewController: UIViewController) {
        
    }
    
    func terminate(currentViewController: UIViewController, withAnimation: Bool) {
        
    }
    
    func navigateToErrorNotification(currentViewController: UIViewController, withAnimation: Bool, title: String, content: String) {
        let vm = ErrorNotificationViewModel(errorTitle: title, errorContent: content)
        let vc = ErrorNotificationViewController(viewModel: vm)
        vc.modalPresentationStyle = .overCurrentContext
        self.navigationController.present(vc, animated: withAnimation, completion: nil)
    }
}
