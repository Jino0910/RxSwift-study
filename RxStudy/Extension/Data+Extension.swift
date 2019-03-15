//
//  Data+Extension.swift
//  BomappSwiftTest
//
//  Created by ByoungHoon Yun on 2018. 5. 29..
//  Copyright © 2018년 Redvelvet Ventures. All rights reserved.
//

import Foundation

extension Data {
    
    mutating func appendByte(_ input:UInt8) {
        var inputValue = input
        let buffer = UnsafeBufferPointer(start: &inputValue, count: 4)
        self.append(buffer)
    }
    
    
}
