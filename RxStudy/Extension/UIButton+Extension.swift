//
//  UIButton+Extension.swift
//  Bomapp
//
//  Created by ByoungHoon Yun on 2018. 7. 26..
//  Copyright © 2018년 Redvelvet Ventures Inc. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    /// 내보험 정렬 디폴트 설정
    func settingButton(title:String,
                       normalFont:UIFont,
                       normalColor:UIColor,
                       normalBackgroundColor:UIColor,
                       selectedFont:UIFont,
                       selectedColor:UIColor,
                       selectedBackgroundColor:UIColor) {
        
        // setNSAttributedStringKey
        let normalAttributes: [NSAttributedStringKey: Any] = [
            .font : normalFont,
            .foregroundColor : normalColor
        ]
        
        let selectedAttributes: [NSAttributedStringKey: Any] = [
            .font : selectedFont,
            .foregroundColor : selectedColor
        ]
        
        let menuNormalAttributed = NSAttributedString(string: title, attributes: normalAttributes)
        
        let menuSelectedAttributed = NSAttributedString(string: title, attributes: selectedAttributes)
        
        // setAttributedTitle
        self.setAttributedTitle(menuNormalAttributed, for: .normal)
        self.setAttributedTitle(menuSelectedAttributed, for: .selected)
        self.setBackgroundImage(UIImage(color: normalBackgroundColor), for: .normal)
        self.setBackgroundImage(UIImage(color: selectedBackgroundColor), for: .selected)
        
    }
    
    func settingSortButton(isSelected:Bool) {
        
        UIView.setAnimationsEnabled(false)
        self.isSelected = isSelected
        UIView.setAnimationsEnabled(true)
    }
    
}
