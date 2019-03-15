//
//  FileManagerExtension.swift
//  Rose
//
//  Created by mydol on 2018. 1. 15..
//  Copyright © 2018년 com. All rights reserved.
//

import Foundation

extension FileManager {
  
  static var documentsDirectory:URL {
    return FileManager.default.urls(for: .documentDirectory
      , in: .userDomainMask).last!
  }
  
}
