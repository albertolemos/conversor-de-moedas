//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Alberto Lemos on 26/02/25.
//

import SwiftUI

struct IconGrid: View {
  @Binding var currency: Currency
  
  var body: some View {
    LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
      ForEach(Currency.allCases) { currency in
        if self.currency == currency {
          CurrencyIcon(image: currency.image, name: currency.name)
            .shadow(color: .black, radius: 10)
            .overlay {
              RoundedRectangle(cornerRadius: 25)
                .stroke(lineWidth: 3)
                .opacity(0.5)
            }
        } else {
          CurrencyIcon(image: currency.image, name: currency.name)
            .onTapGesture {
              self.currency = currency
            }
        }
      }
    }
  }
}

#Preview {
  @Previewable @State var currency: Currency = .silverPiece
  IconGrid(currency: $currency)
}
