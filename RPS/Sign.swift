//
//  Sign.swift
//  RPS
//
//  Created by 文盛業 on 2019/03/01.
//  Copyright © 2019 Sungup Priv. All rights reserved.
//

import Foundation
import GameplayKit

let robotFace = "🤖"

enum Sign {
  // ==================
  // Enumerator members
  // ==================
  case rock, paper, scissors

  // ========================
  // Static members variables
  // ========================
  private static let __randomGen = GKRandomDistribution(lowestValue: 0,
                                                        highestValue: 2)

  private static let __gameTable: [[GameState]] = [
    [.draw, .lose, .win], // Rock
    [.win, .draw, .lose], // Paper
    [.lose, .win, .draw]  // Scissor
  ]

  // =======================
  // Static member functions
  // =======================
  static func random() -> Sign {
    let sign = __randomGen.nextInt()

    switch sign {
    case 0: return .rock
    case 1: return .paper
    default: return .scissors
    }
  }

  // ===========================
  // Enumerator member functions
  // ===========================
  var symbol: String {
    switch self {
    case .rock:     return "👊"
    case .paper:    return "🖐"
    case .scissors: return "✌️"
    }
  }

  var int: Int {
    switch self {
    case .rock:     return 0
    case .paper:    return 1
    case .scissors: return 2
    }
  }

  func match(_ opposit: Sign) -> GameState {
    return Sign.__gameTable[self.int][opposit.int]
  }
}
