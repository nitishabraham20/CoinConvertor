//
//  ContentView.swift
//  LOTRConvertor_iOS17
//
//  Created by Nitish on 02/02/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State private var lhsAmount = ""
    
    @State private var rhsAmount = ""
    
    @State private var showExchangeInfoView = false
    
    @State private var showCurrencySelectionView = false
    
    @State private var lhsCurrency: Currency = Currency(rawValue: UserDefaults.standard.double(forKey: "lhsCurrency")) ?? .silverPiece
    
    @State private var rhsCurrency: Currency = Currency(rawValue: UserDefaults.standard.double(forKey: "rhsCurrency")) ?? .goldPiece
    
    @FocusState private var leftTyping
    
    @FocusState private var rightTyping
    
    var body: some View {
        NavigationStack {
            ZStack {
                //background image
                Image(.background)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    //image
                    Image(.prancingpony)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                    
                    //currency text
                    Text("Currency Exchange")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    
                    HStack {
                        //LHS Section
                        VStack {
                            //currency info
                            HStack {
                                //currency image
                                Image(lhsCurrency.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 40)
                                
                                //currency name
                                Text(lhsCurrency.currencyName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            }
                            .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                            .onTapGesture {
                                showCurrencySelectionView.toggle()
                            }
                            
                            //textfield
                            TextField("Amount", text: $lhsAmount)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                                .focused($leftTyping)
                                .onChange(of: lhsAmount) {
                                    if leftTyping {
                                        rhsAmount = lhsCurrency.convert(lhsAmount, to: rhsCurrency)
                                    }
                                }
                            
                        }
                        .padding([.top, .bottom, .leading])
                        
                        //equal sign
                        Image(systemName: "equal")
                            .font(.title)
                            .foregroundStyle(.white)
                            .symbolEffect(.pulse)
                        
                        //RHS Section
                        VStack {
                            //currency info
                            HStack {
                                //currency name
                                Text(rhsCurrency.currencyName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                //currency image
                                Image(rhsCurrency.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 40)
                            }
                            .onTapGesture {
                                showCurrencySelectionView.toggle()
                            }
                            
                            
                            //textfield
                            TextField("Amount", text: $rhsAmount)
                                .textFieldStyle(.roundedBorder)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                                .focused($rightTyping)
                                .onChange(of: rhsAmount) {
                                    if rightTyping {
                                        lhsAmount = rhsCurrency.convert(rhsAmount, to: lhsCurrency)
                                    }
                                }
                            
                        }
                        .padding([.top, .bottom, .trailing])
                    }
                    .background(.black.opacity(0.5))
                    .clipShape(.capsule)
                    
                    Spacer()
                    
                }
                .padding([.leading, .trailing])
            }
            .toolbar {
                Button {
                    showExchangeInfoView.toggle()
                } label: {
                    Image(systemName: "info.circle.fill")
                        .font(.title)
                        .foregroundStyle(.white)
                }
            }
            .task {
                try? Tips.configure([.displayFrequency(.immediate), .datastoreLocation(.applicationDefault)])
            }
            .onChange(of: lhsCurrency) {
                lhsAmount = rhsCurrency.convert(rhsAmount, to: lhsCurrency)
                UserDefaults.standard.setValue(lhsCurrency.rawValue, forKey: "lhsCurrency")
            }
            .onChange(of: rhsCurrency) {
                rhsAmount = lhsCurrency.convert(lhsAmount, to: rhsCurrency)
                UserDefaults.standard.setValue(rhsCurrency.rawValue, forKey: "rhsCurrency")
            }
            .sheet(isPresented: $showExchangeInfoView, content: {
                ExchangeInfoView()
            })
            .sheet(isPresented: $showCurrencySelectionView, content: {
                CurrencySelectionView(topCurrency: $lhsCurrency, bottomCurrency: $rhsCurrency)
            })
            .onTapGesture {
                leftTyping = false
                rightTyping = false
            }
        }
    }
}

#Preview {
    ContentView()
}
