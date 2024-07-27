//
//  ExchangeInfoView.swift
//  LOTRConvertor_iOS17
//
//  Created by Nitish on 06/02/24.
//

import SwiftUI

struct ExchangeInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                Spacer()
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                
                HStack {
                    Image(.goldpiece)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                    Text("1 Gold Piece = 4 Gold Pennies")
                    Image(.goldpenny)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                }
                
                HStack {
                    Image(.goldpenny)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                    Text("1 Gold Penny = 4 Silver Pieces")
                    Image(.silverpiece)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                }
                
                HStack {
                    Image(.silverpiece)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                    Text("1 Silver Piece = 4 Silver Pennies")
                    Image(.silverpenny)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                }
                
                HStack {
                    Image(.silverpenny)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                    Text("1 Silver Penny = 100 Copper Pennies")
                    Image(.copperpenny)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                }
                
                Button("Done") {
                    dismiss()
                }
                .padding()
                .foregroundStyle(.white)
                .background(.brown)
                .font(.title)
                .clipShape(.buttonBorder)
                
                Spacer()
            }
                
        }
    }
}

#Preview {
    ExchangeInfoView()
}
