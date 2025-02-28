//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Alberto Lemos on 26/02/25.
//

import SwiftUI

struct CurrencyIcon: View {
  let image: ImageResource
  let name: String
  
  var body: some View {
    ZStack(alignment: .bottom) {
      // currency image
      Image(image)
        .resizable()
        .scaledToFit()
        .frame(height: 100)
      
      // currency name
      Text(name)
        .padding(3)
        .font(.caption)
        .frame(maxWidth: .infinity)
        .background(.brown.opacity(0.75))
    }
    .padding(3)
    .frame(width: 100, height: 100)
    .background(.brown)
    .clipShape(.rect(cornerRadius: 25))
  }
}
