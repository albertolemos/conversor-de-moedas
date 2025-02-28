//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Alberto Lemos on 25/02/25.
//

import SwiftUI

struct ContentView: View {
  @State var showExchangeInfo = false
  @State var showSelectCurrency = false
  
  @State var leftAmount = ""
  @State var rightAmount = ""
  
  @State var leftCurrency: Currency = .silverPiece
  @State var rightCurrency: Currency = .goldPiece
  
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
            }
            
            
            // input de texto
            TextField("Amount", text: $leftAmount)
              .textFieldStyle(.roundedBorder)
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
            }
            
            // input de texto
            TextField("Amount", text: $rightAmount)
              .textFieldStyle(.roundedBorder)
              .multilineTextAlignment(.trailing)
          }
        }
        .padding()
        .background(.black.opacity(0.5))
        .clipShape(.capsule)
        
        
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
          .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
          }
          .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
          }
        }
      }
    }
  }
}

#Preview {
    ContentView()
}
