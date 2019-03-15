//
//  UInt32+Extension.swift
//  BomappSwiftTest
//
//  Created by ByoungHoon Yun on 2018. 5. 29..
//  Copyright © 2018년 Redvelvet Ventures. All rights reserved.
//

import Foundation

extension UInt32 {
    var asByteArray: [UInt8] {
        return [0, 8, 16, 24]
            .map { UInt8(self >> $0 & 0x000000FF) }
    }
}


