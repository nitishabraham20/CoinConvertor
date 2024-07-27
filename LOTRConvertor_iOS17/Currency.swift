//
//  Currency.swift
//  LOTRConvertor_iOS17
//
//  Created by Nitish on 06/02/24.
//

import SwiftUI

enum Currency: Double, Identifiable, CaseIterable {
    case copperPenny = 6400
    case silverPenny = 64
    case goldPenny = 4
    case silverPiece = 16
    case goldPiece = 1
    
    var id: Double {
        self.rawValue
    }
    
    var imageName: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .goldPenny:
                .goldpenny
        case .silverPiece:
                .silverpiece
        case .goldPiece:
                .goldpiece
        }
    }
    
    var currencyName: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .goldPenny:
            "Gold Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPiece:
            "Gold Piece"
        }
    }
    
    func convert(_ amount: String, to currency: Currency) -> String {
        guard let amount = Double(amount) else { return "" }
        let convertedAmount = (amount / self.rawValue) * currency.rawValue
        return String(format: "%.2f", convertedAmount)
    }
}
