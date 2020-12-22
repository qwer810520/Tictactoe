//
//  GameViewController.swift
//  TicTacToe
//
//  Created by 楷岷 張 on 2017/3/1.
//  Copyright © 2017年 Min. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

  lazy private var baseView: GameBaseView = {
    let view = GameBaseView()
    view.delegate = self
    return view
  }()

  var presenter: GamePresenter?

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter = GamePresenter(delegate: self)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupUserInterface()
  }

  // MARK: - Private Methods

  private func setupUserInterface() {
    view.addSubview(baseView)
    setupLayout()
  }

  private func setupLayout() {
    view.addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|[baseView]|",
      options: [],
      metrics: nil,
      views: ["baseView": baseView]))

    view.addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "V:|[baseView]|",
      options: [],
      metrics: nil,
      views: ["baseView": baseView]))
  }
}

  // MARK: - GameBaseDelegate

extension GameViewController: GamePresenterDelegate {
  func setupTopTitle(with player: Players) {
    baseView.setupPlayerMessageLabel(with: player)
  }

  func isHaveWinner(with winner: Players) {
    baseView.setupHaveWinnerUI(with: winner)
  }

  func isFinalStep() {
    baseView.setupIsFinalStepUI()
  }

  func resetUI() {
    baseView.resetUI()
  }
}

extension GameViewController: GameBaseDelegate {
  func gameControlDidPressed(with tag: Int) -> String? {
    return presenter?.didSelectButton(with: tag)
  }

  func playAgainButtonDidPressed() {
    presenter?.initGame()
  }
}

