//
//  TopBarView.swift
//  StocksChatApp
//
//  Created by Стас Жингель on 26.11.2021.
//

import SwiftUI

struct TopBarView: View {
    @State var currentSelection: Int = 0
    var ticker: Result
    var body: some View {
        
        PagerTabView(tint: .black,selection: $currentSelection){
            
            Text("График")
                .font(Font.system(size: 14))
                .pageLabel()
            
            Text("Информация")
                .font(Font.system(size: 14))
                .pageLabel()
            
            Text("Чат")
                .font(Font.system(size: 14))
                .pageLabel()
            
            Text("Другое")
                .font(Font.system(size: 14))
                .pageLabel()
            
        } content: {
            
            ScrollView {
                VStack {
                    Text(ticker.displayName)
                    Rectangle()
                        .strokeBorder()
                        .frame(height: 300)
                        .padding(.horizontal,5)
                }
            }
                .pageView(ignoresSafeArea: true, edges: .bottom)
            
            Color.green
                .pageView(ignoresSafeArea: true, edges: .bottom)
            
            Color.yellow
                .pageView(ignoresSafeArea: true, edges: .bottom)
            
            Color.purple
                .pageView(ignoresSafeArea: true, edges: .bottom)
        }
        .padding(.top)
        .ignoresSafeArea(.container, edges: .bottom)

    }
}




