//
//  LoginVM.swift
//  RxStudy
//
//  Created by rowkaxl on 2018. 8. 15..
//  Copyright © 2018년 rowkaxl. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct LoginVM {
    
    let vc: LoginVC
    
    init(_ vc: LoginVC) {
        self.vc = vc
    }
}

extension LoginVM {
    
    // RX
    
    func observeConfirmBtn() {
        
        let emailVaild = vc.emailTF.rx.text.orEmpty
            .map { self.isValidEmail($0) }
        
        let passwordVaild = vc.passwordTF.rx.text.orEmpty
            .map { self.isValidPassword($0) }
        
        let everyThingVaild = Observable.combineLatest(emailVaild, passwordVaild) { $0 && $1 }
        
        everyThingVaild
            .bind(to: vc.confirmBtn.rx.isEnabled)
            .disposed(by: vc.disposeBag)
    }
    
    func observeTextFieldLayerColor() {
        
        vc.emailTF.rx.controlEvent(.editingDidEnd)
            .asObservable()
            .subscribe(onNext:{ _ in
                print(self.vc.emailTF.text ?? "")
                
                if self.isValidEmail(self.vc.emailTF.text!) {
                    self.vc.emailTF.layer.borderColor = UIColor.darkGray.cgColor
                }else {
                    self.vc.emailTF.layer.borderColor = UIColor.red.cgColor
                }
            })
            .disposed(by: vc.disposeBag)
        
        vc.passwordTF.rx.controlEvent(.editingDidEnd)
            .asObservable()
            .subscribe(onNext:{ _ in
                print(self.vc.passwordTF.text ?? "")
                
                if self.isValidPassword(self.vc.passwordTF.text!) {
                    self.vc.passwordTF.layer.borderColor = UIColor.darkGray.cgColor
                }else {
                    self.vc.passwordTF.layer.borderColor = UIColor.red.cgColor
                }
            })
            .disposed(by: vc.disposeBag)
    }
    
    func observeConfirmBtnClick() -> Observable<String>{
        
        return vc.confirmBtn.rx.tap.map{"1"}
    }
}

extension LoginVM {
    
    /*
     
     ^                          Start anchor
     (?=.*[0-9])                숫자 1개이상
     (?=.*[a-z])                소문자 1개이상
     (?=.*[A-Z])                대문자 1개이상
     (?=.*[!@#$&*])             특수문자 1개이상
     .{8,}                      8자 이상
     $                          End anchor.
     
     추가적으로...
     숫자 2개이상일경우 (?=.*[0-9].*[0-9])
     
     */
    
    func isValidEmail(_ email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailRegVaild = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailRegVaild.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        
        let passwordRegEx = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$&*]).{8,}$"
        let passwordRegVaild = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordRegVaild.evaluate(with: password)
    }
}
