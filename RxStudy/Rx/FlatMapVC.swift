//
//  FlatMapVC.swift
//  RxStudy
//
//  Created by rowkaxl on 2018. 9. 16..
//  Copyright © 2018년 rowkaxl. All rights reserved.
//

import UIKit
import RxSwift

struct Student {
    
    var score: BehaviorSubject<Int>
}

class FlatMapVC: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    
    let disposeBag = DisposeBag()
    
    let nameA = Student(score: BehaviorSubject(value: 50))
    let nameB = Student(score: BehaviorSubject(value: 80))
    
    let student = PublishSubject<Student>()

    override func viewDidLoad() {
        super.viewDidLoad()

        student
            .flatMap{
                $0.score
            }
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)
        
        student.onNext(nameA)
        
        nameA.score.onNext(55)
        
        student.onNext(nameB)
        
        nameA.score.onNext(90)
        
        nameB.score.onNext(100)
        
        setRX()
    }
    
    func setRX() {
        
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
