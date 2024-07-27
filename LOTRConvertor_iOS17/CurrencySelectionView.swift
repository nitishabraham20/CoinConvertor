//
//  CurrencySelectionView.swift
//  LOTRConvertor_iOS17
//
//  Created by Nitish on 06/02/24.
//

import SwiftUI

struct CurrencySelectionView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var topCurrency: Currency
    
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack() {
                CurrencyGridView(selectedCurrency: $topCurrency, currencyTitle: "Select the currency you are starting with:")
                CurrencyGridView(selectedCurrency: $bottomCurrency, currencyTitle: "Select the currency you would like to convert to:")
                Spacer()
                Button("Done") {
                    dismiss()
                }
                .padding()
                .foregroundStyle(.white)
                .background(.brown)
                .font(.title)
                .clipShape(.buttonBorder)
            }
        }
    }
}

#Preview {
    CurrencySelectionView(topCurrency: .constant(.silverPiece), bottomCurrency: .constant(.goldPiece))
}
