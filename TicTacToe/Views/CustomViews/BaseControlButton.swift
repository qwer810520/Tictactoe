//
//  BaseControlButton.swift
//  TicTacToe
//
//  Created by Min on 2020/9/2.
//  Copyright © 2020 Min. All rights reserved.
//

import UIKit

class BaseControlButton: UIButton {

  // MARK: - Initialization

  init(textSize: CGFloat) {
    super.init(frame: .zero)
    setupUserInterface(with: textSize)
  }

  convenience init(tag: Int, withEvent event: (target: Any?, action: Selector)) {
    self.init(textSize: 75)
    self.tag = tag
    addTarget(event.target, action: event.action, for: .touchUpInside)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Private Methods

  private func setupUserInterface(with fontSize: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .baseGray
    setTitleColor(.baseBackgroundColor, for: .normal)
    titleLabel?.font = .boldSystemFont(ofSize: fontSize)
  }
}
