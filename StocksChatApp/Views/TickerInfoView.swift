//
//  TickerInfoView.swift
//  StocksChatApp
//
//  Created by Стас Жингель on 26.11.2021.
//

import SwiftUI

struct TickerInfoView: View {
    var ticker: TickerElement
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        TopBarView(ticker: ticker)
        .navigationTitle(ticker.name)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.backward")
            Text("Back")
        }))
    }
}

