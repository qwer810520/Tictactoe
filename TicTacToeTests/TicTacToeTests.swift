//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Min on 2020/9/2.
//  Copyright © 2020 Min. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {

  var presenter: GamePresenter!

  override func setUp() {
    presenter = GamePresenter()
  }

  override func tearDown() {
    presenter = nil
  }

  func testPlayer1ToPlayer2() {
    presenter.didSelectButton(with: 0)

    XCTAssertEqual(presenter.player, Players.player2)
    XCTAssertEqual(presenter.player.playerTitle, Players.player2.playerTitle)
  }

  func testGameArrayIndex0IsReturnO() {
    let text = presenter.didSelectButton(with: 0)

    XCTAssertNotNil(text)
    XCTAssertEqual(text, "O")
  }

  func testGameArrayIndex0IsReturnNilAndPlayerNotChange() {
    presenter.didSelectButton(with: 0)

    let player = presenter.player
    let text = presenter.didSelectButton(with: 0)

    XCTAssertEqual(presenter.player, player)
    XCTAssertNil(text)
  }

  func testCheckIsFinalStepIsTrue() {
    presenter.didSelectButton(with: 0)
    presenter.didSelectButton(with: 1)
    presenter.didSelectButton(with: 2)
    presenter.didSelectButton(with: 3)
    presenter.didSelectButton(with: 4)
    presenter.didSelectButton(with: 5)
    presenter.didSelectButton(with: 6)
    presenter.didSelectButton(with: 7)
    presenter.didSelectButton(with: 8)

    XCTAssertTrue(presenter.checkIsFinalStep())
  }

  func testCheckIsFinalStepIsFalse() {
    presenter.didSelectButton(with: 0)
    XCTAssertFalse(presenter.checkIsFinalStep())
  }

  func testPlayerIs1AndGameAllElementIsZero() {
    presenter.didSelectButton(with: 0)
    presenter.didSelectButton(with: 2)
    presenter.didSelectButton(with: 3)
    presenter.didSelectButton(with: 5)

    presenter.initGame()

    XCTAssertEqual(presenter.player, Players.player1)
    XCTAssertFalse(presenter.checkIsFinalStep())
  }

  func testCheckGameIndex012WithPlayer1IsWinner() {
    presenter.didSelectButton(with: 0)
    presenter.didSelectButton(with: 4)
    presenter.didSelectButton(with: 1)
    presenter.didSelectButton(with: 3)
    presenter.didSelectButton(with: 2)

    let result = presenter.checkWinnerConditions()

    XCTAssertTrue(result.isHaveWinner)
    XCTAssertEqual(result.winner, Players.player1)
  }

  func testCheckPlayer1IsWinnerForIndex345() {
    presenter.didSelectButton(with: 3)
    presenter.didSelectButton(with: 1)
    presenter.didSelectButton(with: 4)
    presenter.didSelectButton(with: 2)
    presenter.didSelectButton(with: 5)

    let result = presenter.checkWinnerConditions()

    XCTAssertTrue(result.isHaveWinner)
    XCTAssertEqual(result.winner, Players.player1)
  }

  func testCheckPlayer1IsWinnerForIndex678() {
    presenter.didSelectButton(with: 6)
    presenter.didSelectButton(with: 4)
    presenter.didSelectButton(with: 7)
    presenter.didSelectButton(with: 3)
    presenter.didSelectButton(with: 8)

    let result = presenter.checkWinnerConditions()

    XCTAssertTrue(result.isHaveWinner)
    XCTAssertEqual(result.winner, Players.player1)
  }

  func testCheckPlayer1IsWinnerForIndex036() {
    presenter.didSelectButton(with: 0)
    presenter.didSelectButton(with: 4)
    presenter.didSelectButton(with: 3)
    presenter.didSelectButton(with: 5)
    presenter.didSelectButton(with: 6)

    let result = presenter.checkWinnerConditions()

    XCTAssertTrue(result.isHaveWinner)
    XCTAssertEqual(result.winner, Players.player1)
  }

  func testCheckPlayer1IsWinnerForIndex147() {
    presenter.didSelectButton(with: 1)
    presenter.didSelectButton(with: 3)
    presenter.didSelectButton(with: 4)
    presenter.didSelectButton(with: 2)
    presenter.didSelectButton(with: 7)

    let result = presenter.checkWinnerConditions()

    XCTAssertTrue(result.isHaveWinner)
    XCTAssertEqual(result.winner, Players.player1)
  }

  func testCheckPlayer1IsWinnerForIndex258() {
    presenter.didSelectButton(with: 2)
    presenter.didSelectButton(with: 4)
    presenter.didSelectButton(with: 5)
    presenter.didSelectButton(with: 0)
    presenter.didSelectButton(with: 8)

    let result = presenter.checkWinnerConditions()

    XCTAssertTrue(result.isHaveWinner)
    XCTAssertEqual(result.winner, Players.player1)
  }

  func testCheckPlayer1IsWinnerForIndex048() {
    presenter.didSelectButton(with: 0)
    presenter.didSelectButton(with: 1)
    presenter.didSelectButton(with: 4)
    presenter.didSelectButton(with: 2)
    presenter.didSelectButton(with: 8)

    let result = presenter.checkWinnerConditions()

    XCTAssertTrue(result.isHaveWinner)
    XCTAssertEqual(result.winner, Players.player1)
  }

  func testCheckPlayer1IsWinnerForIndex246() {
    presenter.didSelectButton(with: 2)
    presenter.didSelectButton(with: 1)
    presenter.didSelectButton(with: 4)
    presenter.didSelectButton(with: 5)
    presenter.didSelectButton(with: 6)

    let result = presenter.checkWinnerConditions()

    XCTAssertTrue(result.isHaveWinner)
    XCTAssertEqual(result.winner, Players.player1)
  }
}
