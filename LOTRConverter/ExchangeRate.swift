//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Alberto Lemos on 26/02/25.
//

import SwiftUI

struct ExchangeRate: View {
  let leftImage: ImageResource
  let text: String
  let rightImage: ImageResource
  
  var body: some View {
    HStack {
      // left currency image
      Image(leftImage)
        .resizable()
        .scaledToFit()
        .frame(width: 33)
      
      // exchange rate text
      Text(text)
      
      // right currency image
      Image(rightImage)
        .resizable()
        .scaledToFit()
        .frame(width: 33)
    }
  }
}
