//
//  CurrencyTip.swift
//  LOTRConvertor_iOS17
//
//  Created by Nitish on 08/02/24.
//

import TipKit

struct CurrencyTip: Tip {
    var title: Text {
        Text("Change Currency")
    }

    var message: Text? {
        Text("Tap on left or right currency to select a different currency")
    }

//    var image: Image? {
//        Image(systemName: "star")
//    }
}
