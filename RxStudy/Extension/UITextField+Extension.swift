//
//  UITextFieldExtension.swift
//  Rose
//
//  Created by mydol on 2018. 1. 2..
//  Copyright © 2018년 com. All rights reserved.
//

import UIKit

extension UITextField
{
  enum Direction
  {
    case left
    case right
  }
  
  func addText(direction:Direction, text:String, font:UIFont, textColor:UIColor, viewFrame:CGRect, labelLeftMagin:CGFloat, backgroundColor:UIColor) {
    
    let View = UIView(frame: viewFrame)
    View.backgroundColor = backgroundColor
    
    let label = UILabel(frame: CGRect(x: labelLeftMagin, y: 0, width: viewFrame.width - labelLeftMagin, height: viewFrame.height))
    label.text = text
    label.font = font
    label.textColor = textColor
    
    View.addSubview(label)
    
    if Direction.left == direction
    {
      self.leftViewMode = .always
      self.leftView = View
    }
    else
    {
      self.rightViewMode = .always
      self.rightView = View
    }

  }
  
  func addImage(direction:Direction, imageName:String, Frame:CGRect, backgroundColor:UIColor) {
    let View = UIView(frame: Frame)
    View.backgroundColor = backgroundColor
    
    let imageView = UIImageView(frame: Frame)
    imageView.image = UIImage(named: imageName)
    imageView.contentMode = .center
    
    View.addSubview(imageView)
    
    if Direction.left == direction
    {
      self.leftViewMode = .always
      self.leftView = View
    }
    else
    {
      self.rightViewMode = .always
      self.rightView = View
    }
  }
  

}
