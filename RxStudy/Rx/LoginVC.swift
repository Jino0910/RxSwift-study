//
//  LoginVC.swift
//  RxStudy
//
//  Created by rowkaxl on 2018. 8. 15..
//  Copyright © 2018년 rowkaxl. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginVC: UIViewController {
    
    var vm : LoginVM?
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setRX()
    }
    
    func setUI() {
        
        confirmBtn.setBackgroundImage(UIImage(color: UIColor.green), for: .normal)
        confirmBtn.setBackgroundImage(UIImage(color: UIColor.darkGray), for: .disabled)
    }
    
    func setRX() {
        
        vm = LoginVM(self)
        
        vm?.observeConfirmBtn()
        vm?.observeTextFieldLayerColor()
        vm?.observeConfirmBtnClick().subscribe(onNext: { (string) in
            
        }).disposed(by: disposeBag)
        
        backBtn.rx.tap
            .subscribe(onNext:{
                self.navigationController?.popViewController(animated: true)
            })
        .disposed(by: disposeBag)
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
}

extension LoginVC {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
