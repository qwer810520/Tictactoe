//
//  UIVIew+Ex.swift
//  TicTacToe
//
//  Created by Min on 2020/9/2.
//  Copyright © 2020 Min. All rights reserved.
//

import UIKit

extension UIView {
  func addSubviews(_ views: [UIView]) {
    views.forEach { addSubview($0) }
  }
}
