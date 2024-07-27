//
//  CurrencyGridView.swift
//  LOTRConvertor_iOS17
//
//  Created by Nitish on 06/02/24.
//

import SwiftUI

struct CurrencyGridView: View {
    
    @Binding var selectedCurrency: Currency
    
    let currencyTitle: String
    
    var body: some View {
        Text(currencyTitle)
            .padding()
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
        
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], content: {
            ForEach(Currency.allCases) { currency in
                if currency == selectedCurrency {
                    ZStack(alignment: .bottom, content: {
                        Image(currency.imageName)
                            .resizable()
                            .scaledToFit()
                        Text(currency.currencyName)
                            .padding(3)
                            .font(.caption)
                            .frame(maxWidth: .infinity)
                            .background(.brown.opacity(0.7))
                    })
                    .frame(width: 100, height: 100)
                    .background(.brown)
                    .clipShape(.rect(cornerRadius: 25))
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 3)
                    }
                    .shadow(color: .black, radius: 5)
                } else {
                    ZStack(alignment: .bottom, content: {
                        Image(currency.imageName)
                            .resizable()
                            .scaledToFit()
                        Text(currency.currencyName)
                            .padding(3)
                            .font(.caption)
                            .frame(maxWidth: .infinity)
                            .background(.brown.opacity(0.7))
                    })
                    .frame(width: 100, height: 100)
                    .background(.brown)
                    .clipShape(.rect(cornerRadius: 25))
                    .onTapGesture {
                        selectedCurrency = currency
                    }
                }
            }
        })
    }
}

#Preview {
    CurrencyGridView(selectedCurrency: .constant(.copperPenny), currencyTitle: "Select the currency you are starting with:")
}
