//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Alberto Lemos on 25/02/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
  @State var showExchangeInfo = false
  @State var showSelectCurrency = false
  
  @State var leftAmount = ""
  @State var rightAmount = ""
  
  @FocusState var leftTypingFocus: Bool
  @FocusState var rightTypingFocus: Bool
  
  @State var leftCurrency: Currency = UserDefaults.standard.string(forKey: "leftCurrency")
    .flatMap(Currency.init(rawValue:)) ?? .silverPiece
  @State var rightCurrency: Currency = UserDefaults.standard.string(forKey: "rightCurrency")
    .flatMap(Currency.init(rawValue:)) ?? .goldPiece
  
  let currencyTip = CurrencyTip()
  
  var body: some View {
    ZStack {
      // imagem de fundo
      Image(.background)
        .resizable()
        .edgesIgnoringSafeArea(.all)
      VStack {
        // imagem do poney
        Image(.prancingpony)
          .resizable()
          .scaledToFit()
          .frame(height: 200)
        
        // texto para conversão
        Text("Currency Exchange")
          .font(.largeTitle)
          .foregroundStyle(.white)
        
        // seção da conversão
        HStack {
          // seção da esquerda
          VStack {
            // atual
            HStack {
              // imagem valor atual
              Image(leftCurrency.image)
                .resizable()
                .scaledToFit()
                .frame(width: 33)
              
              // texto valor atual
              Text(leftCurrency.name)
                .font(.headline)
                .foregroundStyle(.white)
            }
            .padding(.bottom, -5)
            .onTapGesture {
              showSelectCurrency.toggle()
              currencyTip.invalidate(reason: .actionPerformed)
            }
            .popoverTip(currencyTip, arrowEdge: .bottom)
            
            // input de texto
            TextField("Amount", text: $leftAmount)
              .textFieldStyle(.roundedBorder)
              .focused($leftTypingFocus)
          }
          // sinal de igual
          Image(systemName: "equal")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .symbolEffect(.pulse)
          
          // seção da direita
          VStack {
            // atual
            HStack {
              // texto valor atual
              Text(rightCurrency.name)
                .font(.headline)
                .foregroundStyle(.white)
              
              // imagem valor atual
              Image(rightCurrency.image)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            }
            .padding(.bottom, -5)
            .onTapGesture {
              showSelectCurrency.toggle()
              currencyTip.invalidate(reason: .actionPerformed)
            }
            
            // input de texto
            TextField("Amount", text: $rightAmount)
              .textFieldStyle(.roundedBorder)
              .multilineTextAlignment(.trailing)
              .focused($rightTypingFocus)
          }
        }
        .padding()
        .background(.black.opacity(0.5))
        .clipShape(.capsule)
        .keyboardType(.decimalPad)
        
        Spacer()
        
        // botão de informações
        HStack {
          Spacer()
          Button {
            showExchangeInfo.toggle()
          } label: {
            Image(systemName: "info.circle.fill")
              .font(.largeTitle)
              .foregroundStyle(.white)
          }
          .padding(.trailing)
        }
      }
    }
    .task {
      try? Tips.configure()
    }
    .onChange(of: rightAmount) {
      if rightTypingFocus {
        leftAmount = rightCurrency.converter(rightAmount, to: leftCurrency)
      }
    }
    .onChange(of: leftAmount) {
      if leftTypingFocus {
        rightAmount = leftCurrency.converter(leftAmount, to: rightCurrency)
      }
    }
    .onChange(of: leftCurrency) { oldValue, newValue in
      UserDefaults.standard.set(newValue.rawValue, forKey: "leftCurrency")
      leftAmount = rightCurrency.converter(rightAmount, to: leftCurrency)
    }
    .onChange(of: rightCurrency) { oldValue, newValue in
      UserDefaults.standard.set(newValue.rawValue, forKey: "rightCurrency")
      rightAmount = leftCurrency.converter(leftAmount, to: rightCurrency)
    }
    .sheet(isPresented: $showExchangeInfo) {
      ExchangeInfo()
    }
    .sheet(isPresented: $showSelectCurrency) {
      SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
    }
    .onTapGesture {
      leftTypingFocus = false
      rightTypingFocus = false
    }
  }
}

#Preview {
    ContentView()
}
