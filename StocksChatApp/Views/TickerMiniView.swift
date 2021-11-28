//
//  TickerMiniView.swift
//  StocksChatApp
//
//  Created by Стас Жингель on 26.11.2021.
//

import SwiftUI

struct TickerMiniView: View {
    var ticker: TickerElement
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke()
            HStack {
                Image(ticker.symbol)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .padding(5)
                    .clipShape(Circle())
                Text(ticker.name)
                    .foregroundColor(.black)
                Spacer()
                Text(String(format: "%.2f", ticker.symbol) + "$")
                    .foregroundColor(.black)
                    .font(Font.system(size: 18))
                    .bold()
                
            }
            .padding()
        }
        .foregroundColor(Color.rgb(red: 196, green: 196, blue: 196))
        .padding(.horizontal)
        .padding(.vertical,5)
    }
}


