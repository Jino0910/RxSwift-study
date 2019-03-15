//
//  UIAlertController+Extension.swift
//  Bomapp
//
//  Created by ByoungHoon Yun on 2018. 6. 28..
//  Copyright © 2018년 Redvelvet Ventures Inc. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    func addAction(title: String, style: UIAlertActionStyle = .default, handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        let okAction = UIAlertAction(title: title, style: style, handler: handler)
        addAction(okAction)
        return self
    }
    
    func addActionWithTextFields(title: String, style: UIAlertActionStyle = .default, handler: ((UIAlertAction, [UITextField]) -> Void)? = nil) -> Self {
        let okAction = UIAlertAction(title: title, style: style) { [weak self] action in
            handler?(action, self?.textFields ?? [])
        }
        addAction(okAction)
        return self
    }
    
    func configureForIPad(sourceRect: CGRect, sourceView: UIView? = nil) -> Self {
        popoverPresentationController?.sourceRect = sourceRect
        if let sourceView = UIApplication.shared.topViewController?.view {
            popoverPresentationController?.sourceView = sourceView
        }
        return self
    }
    
    func configureForIPad(barButtonItem: UIBarButtonItem) -> Self {
        popoverPresentationController?.barButtonItem = barButtonItem
        return self
    }
    
    func addTextField(handler: @escaping (UITextField) -> Void) -> Self {
        addTextField(configurationHandler: handler)
        return self
    }
    
    func show() {
        UIApplication.shared.topViewController?.present(self, animated: true, completion: nil)
    }
    
    //
    class func showIndicatorAlert(viewController: UIViewController, message: String) {
        DispatchQueue.main.async {
            
            let alert: UIAlertController = self.init(title: nil, message: message, preferredStyle: .alert)
            
            // Add Indicator
            let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            indicator.center = CGPoint(x: 25, y: 30)
            alert.view.addSubview(indicator)
            
            indicator.startAnimating()
            viewController.present(alert, animated: true, completion: nil)
        }
    }

}
