//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Alberto Lemos on 26/02/25.
//

import SwiftUI

struct SelectCurrency: View {
  @Environment(\.dismiss) var dismiss
  @Binding var topCurrency: Currency
  @Binding var bottomCurrency: Currency
  
  var body: some View {
    ZStack {
      Image(.parchment)
        .resizable()
        .ignoresSafeArea()
        .background(.brown)
      
      VStack {
        // text
        Text("Select the currency you are starging with:")
          .fontWeight(.bold)
        
        // currency icons
        IconGrid(currency: $topCurrency)
        
        // text
        Text("Select the currency you would like to convert to:")
          .fontWeight(.bold)
          .padding(.top)
        
        // currency icons
        IconGrid(currency: $bottomCurrency)
        
        // button done
        Button("Done") {
          dismiss()
        }
        .buttonStyle(.borderedProminent)
        .tint(.brown.mix(with: .black, by: 0.2))
        .font(.largeTitle)
        .padding()
        .foregroundStyle(.white)
      }
      .padding()
      .multilineTextAlignment(.center)
      .foregroundStyle(.black)
    }
  }
}

#Preview {
  @Previewable @State var topCurrency: Currency = .copperPenny
  @Previewable @State var bottomCurrency: Currency = .goldPenny
  SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}
