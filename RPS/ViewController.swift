//
//  ViewController.swift
//  RPS
//
//  Created by 文盛業 on 2019/03/01.
//  Copyright © 2019 Sungup Priv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    resetUI()
  }

  // =======
  // Outlets
  // =======
  @IBOutlet weak var robotChoiceLabel: UILabel!
  @IBOutlet weak var gameStatusLabel: UILabel!
  @IBOutlet weak var rockButton: UIButton!
  @IBOutlet weak var paperButton: UIButton!
  @IBOutlet weak var scissorsButton: UIButton!
  @IBOutlet weak var playAgainButton: UIButton!

  // =======
  // Actions
  // =======
  @IBAction func chooseRock(_ sender: UIButton) {
    play(.rock)
  }

  @IBAction func choosePaper(_ sender: UIButton) {
    play(.paper)
  }

  @IBAction func chooseScissors(_ sender: UIButton) {
    play(.scissors)
  }

  @IBAction func playAgain(_ sender: UIButton) {
    resetUI()
  }

  // ==============================
  // User defined control functions
  // ==============================
  func resetUI() {
    // 1. Reset the robotChoice and gameStatus field
    gameStatusLabel.text = GameState.start.label
    robotChoiceLabel.text = robotFace

    // 2. Enable and show the all user choice buttons.
    rockButton.isEnabled = true
    paperButton.isEnabled = true
    scissorsButton.isEnabled = true

    rockButton.isHidden = false
    paperButton.isHidden = false
    scissorsButton.isHidden = false

    // 3. Disable and hide the play again button
    playAgainButton.isEnabled = false
    playAgainButton.isHidden = true
  }

  func updateButtons(_ choice: Sign) {
    // 1. Hide other buttons
    rockButton.isHidden     = (choice != .rock)
    paperButton.isHidden    = (choice != .paper)
    scissorsButton.isHidden = (choice != .scissors)

    // 2. Disable all buttons
    rockButton.isEnabled     = false
    paperButton.isEnabled    = false
    scissorsButton.isEnabled = false

    // 3. Display and enable the play again button
    playAgainButton.isEnabled = true
    playAgainButton.isHidden = false
  }

  func play(_ userChoice: Sign) {
    // 1. Update button status
    updateButtons(userChoice)

    // 2. Choose by robot
    let robotChoice = Sign.random()


    // 3. Update robot and status labels
    robotChoiceLabel.text = robotChoice.symbol
    gameStatusLabel.text = userChoice.match(robotChoice).label
  }
}
