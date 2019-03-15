//
//  UIStoryboard+Extionsion.swift
//  Bomapp
//
//  Created by rowkaxl on 2018. 8. 3..
//  Copyright © 2018년 Redvelvet Ventures Inc. All rights reserved.
//

import UIKit

enum SBName {
    static let Main = "Main"
    static let scraping = "Scraping"
    static let popup = "Popup"
    static let toast = "Toast"
}

extension UIStoryboard {

    class func getSB(name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }
}
