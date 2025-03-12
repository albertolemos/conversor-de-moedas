import SwiftUI

enum Currency: String, CaseIterable, Identifiable {
  case moedaLatao = "128000.0"
  case copperPenny = "6400.0"
  case silverPenny = "64.0"
  case silverPiece = "16.0"
  case goldPenny = "4.0"
  case goldPiece = "1.0"
  
  var id: String { rawValue }
  
  var doubleValue: Double {
    return Double(rawValue) ?? 0.0
  }
  
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
    case .moedaLatao:
        .copperpenny
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
    case .moedaLatao:
      "Latão"
    }
  }
  
  func converter(_ amountString: String, to currency: Currency) -> String {
    guard let DoubleAmount = Double(amountString) else {
      return ""
    }
    
    let convertedAmount = DoubleAmount / self.doubleValue * currency.doubleValue
    return String(format: "%.2f", convertedAmount)
  }
}
