//
//  GameControlView.swift
//  TicTacToe
//
//  Created by Min on 2020/9/2.
//  Copyright © 2020 Min. All rights reserved.
//

import UIKit

protocol GameControlDelegate: class {
  func didPassedControlButton(with tag: Int) -> String?
}

class GameControlView: UIView {

  lazy private var leftTopButton: BaseControlButton = {
    return BaseControlButton(tag: 0, withEvent: (self, #selector(controlButtonDidPressed(_:))))
  }()

  lazy private var centerTopButton: BaseControlButton = {
    return BaseControlButton(tag: 1, withEvent: (self, #selector(controlButtonDidPressed(_:))))
  }()

  lazy private var rightTopButton: BaseControlButton = {
    return BaseControlButton(tag: 2, withEvent: (self, #selector(controlButtonDidPressed(_:))))
  }()

  lazy private var leftCenterButton: BaseControlButton = {
    return BaseControlButton(tag: 3, withEvent: (self, #selector(controlButtonDidPressed(_:))))
  }()

  lazy private var centerButton: BaseControlButton = {
    return BaseControlButton(tag: 4, withEvent: (self, #selector(controlButtonDidPressed(_:))))
  }()

  lazy private var rightCenterButton: BaseControlButton = {
    return BaseControlButton(tag: 5, withEvent: (self, #selector(controlButtonDidPressed(_:))))
  }()

  lazy private var leftBottomButton: BaseControlButton = {
    return BaseControlButton(tag: 6, withEvent: (self, #selector(controlButtonDidPressed(_:))))
  }()

  lazy private var centerBottomTopButton: BaseControlButton = {
    return BaseControlButton(tag: 7, withEvent: (self, #selector(controlButtonDidPressed(_:))))
  }()

  lazy private var rightBottomButton: BaseControlButton = {
    return BaseControlButton(tag: 8, withEvent: (self, #selector(controlButtonDidPressed(_:))))
  }()

  // MARK: - Initialization

  weak var delegate: GameControlDelegate?

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUserInterface()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setButtonEnabled(setStatus status: Bool) {
    leftTopButton.isEnabled = status
    centerTopButton.isEnabled = status
    rightTopButton.isEnabled = status
    leftCenterButton.isEnabled = status
    centerButton.isEnabled = status
    rightCenterButton.isEnabled = status
    leftBottomButton.isEnabled = status
    centerBottomTopButton.isEnabled = status
    rightBottomButton.isEnabled = status
    switch status {
      case true:
        leftTopButton.setTitle(nil, for: .normal)
        centerTopButton.setTitle(nil, for: .normal)
        rightTopButton.setTitle(nil, for: .normal)
        leftCenterButton.setTitle(nil, for: .normal)
        centerButton.setTitle(nil, for: .normal)
        rightCenterButton.setTitle(nil, for: .normal)
        leftBottomButton.setTitle(nil, for: .normal)
        centerBottomTopButton.setTitle(nil, for: .normal)
        rightBottomButton.setTitle(nil, for: .normal)
      case false: break
    }
  }

  // MARK: - Private Methods

  private func setupUserInterface() {
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .clear
    addSubviews([leftTopButton, centerTopButton, rightTopButton, leftCenterButton, centerButton, rightCenterButton, leftBottomButton, centerBottomTopButton, rightBottomButton])
    setupLayout()
  }

  private func setupLayout() {
    let views: [String: Any] = ["leftTopButton": leftTopButton, "centerTopButton": centerTopButton, "rightTopButton": rightTopButton, "leftCenterButton": leftCenterButton, "centerButton": centerButton, "rightCenterButton": rightCenterButton, "leftBottomButton": leftBottomButton, "centerBottomTopButton": centerBottomTopButton, "rightBottomButton": rightBottomButton]
    let space: CGFloat = 10

    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|[leftTopButton(==centerTopButton)]-space-[centerTopButton(==rightTopButton)]-space-[rightTopButton(leftTopButton)]|",
      options: [],
      metrics: ["space": space],
      views: views))

    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|[leftCenterButton(==centerButton)]-space-[centerButton(==rightCenterButton)]-space-[rightCenterButton(leftCenterButton)]|",
      options: [],
      metrics: ["space": space],
      views: views))

    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|[leftBottomButton(==centerBottomTopButton)]-space-[centerBottomTopButton(==rightBottomButton)]-space-[rightBottomButton(leftBottomButton)]|",
      options: [],
      metrics: ["space": space],
      views: views))

    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "V:|[leftTopButton(==leftCenterButton)]-space-[leftCenterButton(==leftBottomButton)]-space-[leftBottomButton(leftTopButton)]|",
      options: [],
      metrics: ["space": space],
      views: views))

    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "V:|[centerTopButton(==centerButton)]-space-[centerButton(==centerBottomTopButton)]-space-[centerBottomTopButton(centerTopButton)]|",
      options: [],
      metrics: ["space": space],
      views: views))

    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "V:|[rightTopButton(==rightCenterButton)]-space-[rightCenterButton(==rightBottomButton)]-space-[rightBottomButton(rightTopButton)]|",
      options: [],
      metrics: ["space": space],
      views: views))
  }

  // MARK: - Action Methods

  @objc private func controlButtonDidPressed(_ button: UIButton) {
    guard let title = delegate?.didPassedControlButton(with: button.tag) else { return }
    button.setTitle(title, for: .normal)
  }
}
