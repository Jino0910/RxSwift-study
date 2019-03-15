//
//  ThrottleVC.swift
//  RxStudy
//
//  Created by rowkaxl on 2018. 9. 16..
//  Copyright © 2018년 rowkaxl. All rights reserved.
//

import UIKit
import RxSwift

class ThrottleVC: UIViewController {
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var backBtn: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setRX()
    }
    func setRX() {

        searchTextField.rx.controlEvent(.editingChanged)
            .asObservable()
            .filter({ (self.searchTextField.text?.length ?? 0) > 0 })
//            .debounce(2.0, scheduler: MainScheduler.instance)
            .throttle(2.0, scheduler: MainScheduler.instance)
            .subscribe(onNext:{ _ in
                print("request API = \(self.searchTextField.text ?? "")")
            })
            .disposed(by:disposeBag)
        
        backBtn.rx.tap
            .subscribe(onNext:{
                self.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
