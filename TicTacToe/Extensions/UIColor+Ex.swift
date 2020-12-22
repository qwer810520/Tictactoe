//
//  UIColor+Ex.swift
//  TicTacToe
//
//  Created by Min on 2020/9/2.
//  Copyright © 2020 Min. All rights reserved.
//

import UIKit

extension UIColor {
  convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
    self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a / 100.0)
  }

  class var baseGray: UIColor {
    if #available(iOS 13.0, *) {
      return UIColor { traitResult -> UIColor in
        switch traitResult.userInterfaceStyle {
          case .dark:
            return .lightGray
          default:
            return .init(r: 76, g: 76, b: 76, a: 100)
        }
      }
    } else {
      return .init(r: 76, g: 76, b: 76, a: 100)
    }
  }

  class var baseBackgroundColor: UIColor {
    if #available(iOS 13.0, *) {
      return .systemBackground
    } else {
      return .white
    }
  }
}
