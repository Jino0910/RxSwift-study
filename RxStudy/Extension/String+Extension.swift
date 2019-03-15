//
//  String+Extension.swift
//  BomappSwiftTest
//
//  Created by ByoungHoon Yun on 2018. 5. 30..
//  Copyright © 2018년 Redvelvet Ventures. All rights reserved.
//

import Foundation

extension String {
    func substring(with nsrange: NSRange) -> Substring? {
        
        guard let range = Range(nsrange, in: self) else { return nil }
        return self[range]
        
    }    
}

extension StringProtocol where Index == String.Index {
    func nsRange(from range: Range<Index>) -> NSRange {
        return NSRange(range, in: self)
    }
}


extension String {
    
    /// 한글 검증
    var checkKorean : Bool {
        
        let regEx = "^[가-힣0-9]+$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", regEx)
        return emailTest.evaluate(with: self)
    }
    
    /// 이메일 검증
    var checkEmail : Bool {
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    /// 폰번호 검증
    var checkTelNumber : Bool {
        let PHONE_REGEX = "^\\d{3}\\d{4}\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return phoneTest.evaluate(with: self)
        
    }
    
    /// 주민등록번호 검증
    var checkRegistration : Bool {
        
        let REGEX = "\\d{2}[01]\\d[0-3]\\d[\\s-]*[1-4]\\d{6}"
        let test = NSPredicate(format: "SELF MATCHES %@", REGEX)
        return test.evaluate(with: self)
        
    }
    
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    var length: Int {
        return self.count
    }
    
}

extension Formatter {
    
    // 100,000,000
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
    
}

extension BinaryInteger {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
