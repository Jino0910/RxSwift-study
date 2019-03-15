//
//  UIViewController+Extension.swift
//  Bomapp
//
//  Created by ByoungHoon Yun on 2018. 6. 27..
//  Copyright © 2018년 Redvelvet Ventures Inc. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
//    func scrapingHandler(type:BoSmartScrapType, status:ScrapingStatus, percent:Int32, output:String?) {
//
//        switch type {
//        case .login, .logout: break
//        default:
//            switch status {
//            case .request: break
//            case .loading: break
////                guard let alert = self.getForegroundAlertController() else { return }
////                alert.message = "로딩중입니다 \(percent)%"
//            case .success:
//                if let alert = self.getForegroundAlertController() {
//                    alert.dismiss(animated: false)
//                }
//
//                self.presentAlert(withTitle: "성공", message: output, confirmTitle: "확인")
//
//            case .fail:
//                if let alert = self.getForegroundAlertController() {
//                    alert.dismiss(animated: true, completion: {
//                        self.presentAlert(withTitle: "실패", message: output, confirmTitle: "확인")
//                    })
//                }
//            }
//        }
//
//        print("[\(percent)]")
//        guard let opString = output else { return }
//        print(opString)
//
//    }
    
    func presentAlert(withTitle title: String,
                      message : String? = nil,
                      confirmTitle:String,
                      cancelTitle:String? = nil,
                      confirmHandler:((UIAlertAction) -> Void)? = nil,
                      cancelHandler:((UIAlertAction) -> Void)? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: confirmTitle, style: .default, handler: confirmHandler)
        alertController.addAction(confirmAction)
        if let cTitle = cancelTitle {
            let cancelAction = UIAlertAction(title: cTitle, style: .cancel, handler: cancelHandler)
            alertController.addAction(cancelAction)
        }
        
        self.present(alertController, animated: true)
        
    }
    
    func getForegroundAlertController() -> UIAlertController? {
        
        var viewController = UIApplication.shared.keyWindow?.rootViewController
        while let controller = viewController?.presentedViewController {
            if controller is UIAlertController {
                viewController = controller
                break
            }
        }
        
        guard let alert = viewController as? UIAlertController else {
            return nil
        }
        return alert
        
    }
    
    func presentActionSheet(list:[String], confirmHandler:((Int) -> Void)?) {
        
        let alert = UIAlertController(title: "기관 선택", message: nil, preferredStyle: .actionSheet)
        
        for (index, item) in list.enumerated() {
            alert.addAction(UIAlertAction(title: item, style: .default, handler: { (_) in
                confirmHandler?(index)
            }))
        }
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        
        
    }

}

//public func goToMain() {
//
//    guard let window = UIApplication.shared.keyWindow else { return }
//    let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController() as! MainTC
//
//    var opt = UIWindow.TransitionOptions(direction: .fade, style: .linear)
//    opt.background = UIWindow.TransitionOptions.Background.solidColor(UIColor.white)
//    opt.duration = 0.2
//
//    window.setRootViewController(vc, options: opt)
//
//}
//

//public func goToPasscode() {
//    guard let window = UIApplication.shared.keyWindow else { return }
//    let vc = UIStoryboard(name: "Reg", bundle: Bundle.main).instantiateViewController(withIdentifier: "PasscodeViewController") as! PasscodeViewController
//    var opt = UIWindow.TransitionOptions(direction: .fade, style: .linear)
//    opt.background = UIWindow.TransitionOptions.Background.solidColor(UIColor.white)
//    opt.duration = 0.2
//    
//    window.setRootViewController(vc, options: opt)
//
//}
//
//public func registBio() {
//    guard let window = UIApplication.shared.keyWindow else { return }
//    let navi = UIStoryboard(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "AuthStepNaviController") as! UINavigationController
//    navi.addCustomTransitioning(enableSwipe: false)
//    
//    var opt = UIWindow.TransitionOptions(direction: .fade, style: .linear)
//    opt.background = UIWindow.TransitionOptions.Background.solidColor(UIColor.white)
//    opt.duration = 0.2
//    
//    window.setRootViewController(navi, options: opt)
//
//}
//
//public func goToMain() {
//    
//    guard let window = UIApplication.shared.keyWindow else { return }
//    let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController()!
////    let navi = UINavigationController(rootViewController: vc)
//    
//    var opt = UIWindow.TransitionOptions(direction: .fade, style: .linear)
//    opt.background = UIWindow.TransitionOptions.Background.solidColor(UIColor.white)
//    opt.duration = 0.2
//    
//    window.setRootViewController(vc, options: opt)
//    
//}




