//
//  UICollectionView+Extension.swift
//  Bomapp
//
//  Created by ByoungHoon Yun on 2018. 8. 1..
//  Copyright © 2018년 Redvelvet Ventures Inc. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerNib(nibID:String) {
        let nib = UINib(nibName: nibID, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: nibID)
    }
    
    
}
