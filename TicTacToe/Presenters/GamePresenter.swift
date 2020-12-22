//
//  GamePresenter.swift
//  TicTacToe
//
//  Created by Min on 2020/9/2.
//  Copyright © 2020 Min. All rights reserved.
//

import UIKit

enum Players: Int {
  case player1 = 1
  case player2
}

extension Players {
  var useText: String {
    return self == .player1 ? "O" : "X"
  }

  var playerTitle: String {
    return self == .player1 ? "Player1" : "Player2"
  }
}

protocol GamePresenterDelegate: class {
  func resetUI()
  func isFinalStep()
  func setupTopTitle(with player: Players)
  func isHaveWinner(with winner: Players)
}

class GamePresenter: NSObject {

  private(set) var player: Players = .player1 {
    didSet {
      checkAllStatus()
    }
  }
  private var game = [0, 0, 0, 0, 0, 0, 0, 0, 0]
  private let winnerCondition = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  private weak var delegate: GamePresenterDelegate?

  // MARK: - Initialization Methods

  init(delegate: GamePresenterDelegate? = nil) {
    super.init()
    self.delegate = delegate
  }

  func initGame() {
    player = .player1
    game = [0,0,0,0,0,0,0,0,0]
    delegate?.resetUI()
  }

  @discardableResult
  func didSelectButton(with tag: Int) -> String? {
    guard game[tag] == 0 else { return nil }
    let text = player.useText
    game[tag] = player.rawValue
    delegate?.setupTopTitle(with: player)
    player = player == .player1 ? .player2 : .player1
    return text
  }

  func checkIsFinalStep() -> Bool {
    return game.allSatisfy { $0 != 0 }
  }

  func checkWinnerConditions() -> (isHaveWinner: Bool, winner: Players) {
    for indexs in winnerCondition where game[indexs[0]] != 0 && game[indexs[0]] == game[indexs[1]] && game[indexs[1]] == game[indexs[2]] {
      guard let player = Players(rawValue: game[indexs[0]]) else { continue }
      return (true, player)
    }
    return (false, .player1)
  }

  // MARK: - Private Methods

  private func checkAllStatus() {
    let winnerResult = checkWinnerConditions()
    switch winnerResult.isHaveWinner {
      case true:
        delegate?.isHaveWinner(with: winnerResult.winner)
      case false:
        guard checkIsFinalStep() else { return }
        delegate?.isFinalStep()
    }
  }
}
