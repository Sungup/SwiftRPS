//
//  GameState.swift
//  RPS
//
//  Created by 文盛業 on 2019/03/01.
//  Copyright © 2019 Sungup Priv. All rights reserved.
//

import Foundation

enum GameState {
  // ==================
  // Enumerator members
  // ==================
  case start, win, lose, draw

  // ===========================
  // Enumerator member functions
  // ===========================
  var label: String {
    switch self {
    case .start: return "Rock, Paper, Scissors?"
    case .win:   return "You won!"
    case .lose:  return "You loose!"
    case .draw:  return "Draw!"
    }
  }
}
