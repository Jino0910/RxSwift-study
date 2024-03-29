//
//  UITableViewCell+Extension.swift
//  RxStudy
//
//  Created by rowkaxl on 2018. 8. 15..
//  Copyright © 2018년 rowkaxl. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
 
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
