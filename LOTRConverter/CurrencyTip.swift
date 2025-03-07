//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Alberto Lemos on 07/03/25.
//

import TipKit

struct CurrencyTip: Tip {
  var title = Text("Change Currency")
  
  var message: Text? = Text("You can tap the left or right currency to bring up the Select Currency screen.")
  
  var image: Image? = Image(systemName: "hand.tap.fill")
}
