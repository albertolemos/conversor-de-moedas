//
//  Currency.swift
//  LOTRConverter
//
//  Created by Alberto Lemos on 26/02/25.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
  case copperPenny = 6400
  case silverPenny = 64
  case silverPiece = 16
  case goldPenny = 4
  case goldPiece = 1
  
  var id: Currency { self }

  var image: ImageResource {
    switch self {
    case .copperPenny:
      .copperpenny
    case .silverPenny:
      .silverpenny
    case .silverPiece:
      .silverpiece
    case .goldPenny:
      .goldpenny
    case .goldPiece:
      .goldpiece
    }
  }

  var name: String {
    switch self {
    case .copperPenny:
      "Copper Penny"
    case .silverPenny:
      "Silver Penny"
    case .silverPiece:
      "Silver Piece"
    case .goldPenny:
      "Gold Penny"
    case .goldPiece:
      "Gold Piece"
    }
  }
  
  func converter(_ amountString: String, to currency: Currency) -> String {
    guard let DoubleAmount = Double(amountString) else {
      return ""
    }
    
    let convertedAmount = DoubleAmount / self.rawValue * currency.rawValue
    return String(format: "%.2f", convertedAmount)
  }
}
