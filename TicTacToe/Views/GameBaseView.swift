//
//  GameBaseView.swift
//  TicTacToe
//
//  Created by Min on 2020/9/2.
//  Copyright © 2020 Min. All rights reserved.
//

import UIKit

protocol GameBaseDelegate: class {
  func playAgainButtonDidPressed()
  func gameControlDidPressed(with tag: Int) -> String?
}

class GameBaseView: UIView {

  lazy private var topTitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Arial", size: 60)
    label.font = .systemFont(ofSize: 60, weight: .semibold)
    label.text = "Tic Tac Toe"
    label.textAlignment = .center
    label.textColor = .baseGray
    return label
  }()

  lazy var gameMessageLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .boldSystemFont(ofSize: 30)
    label.textAlignment = .center
    label.textColor = .baseGray
    label.text = "Start game!"
    return label
  }()

  lazy private var controlView: GameControlView = {
    let view = GameControlView()
    view.delegate = self
    return view
  }()

  lazy private var playAgainButton: BaseControlButton = {
    let button = BaseControlButton(textSize: 25)
    button.setTitle("Play Again", for: .normal)
    button.layer.cornerRadius = 8
    button.addTarget(self, action: #selector(playAgainButtonDidPressed), for: .touchUpInside)
    return button
  }()

  weak var delegate: GameBaseDelegate?

  // MARK: - Initialization

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUserInterface()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func resetUI() {
    gameMessageLabel.text = "Start game!"
    playAgainButton.setTitle("Play Again", for: .normal)
    controlView.setButtonEnabled(setStatus: true)
  }

  func setupIsFinalStepUI() {
    controlView.setButtonEnabled(setStatus: false)
    playAgainButton.setTitle("Draw!!", for: .normal)
  }

  func setupHaveWinnerUI(with winner: Players) {
    gameMessageLabel.text = winner.playerTitle + " winner!!"
    controlView.setButtonEnabled(setStatus: false)
  }

  func setupPlayerMessageLabel(with player: Players) {
    gameMessageLabel.text = "\(player.playerTitle) !!"
  }

  // MARK: - Private Methods

  private func setupUserInterface() {
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .baseBackgroundColor
    addSubviews([topTitleLabel, gameMessageLabel, controlView, playAgainButton])
    setupLayout()
  }

  private func setupLayout() {
    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|[topTitleLabel]|",
      options: [],
      metrics: nil,
      views: ["topTitleLabel": topTitleLabel]))

    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|[gameResultLabel]|",
      options: [],
      metrics: nil,
      views: ["gameResultLabel": gameMessageLabel]))

    let controlViewLeftSpace: CGFloat = 40

    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-space-[controlView]-space-|",
      options: [],
      metrics: ["space": controlViewLeftSpace],
      views: ["controlView": controlView]))

    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-space-[playAgainButton]-space-|",
      options: [],
      metrics: ["space": 80],
      views: ["playAgainButton": playAgainButton]))

    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-35-[topTitleLabel(70)]-19-[gameResultLabel(40)]-50-[controlView(controlViewWidth)]-53-[playAgainButton(50)]",
      options: [],
      metrics: ["controlViewWidth": UIScreen.main.bounds.width - (controlViewLeftSpace * 2)],
      views: ["topTitleLabel": topTitleLabel, "gameResultLabel": gameMessageLabel, "controlView": controlView, "playAgainButton": playAgainButton]))
  }

  // MARK: - Action Methods

  @objc private func playAgainButtonDidPressed() {
    delegate?.playAgainButtonDidPressed()
  }
}

  // MARK: - GameControlDelegate

extension GameBaseView: GameControlDelegate {
  func didPassedControlButton(with tag: Int) -> String? {
    return delegate?.gameControlDidPressed(with: tag)
  }
}
