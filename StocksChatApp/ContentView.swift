//
//  ContentView.swift
//  StocksChatApp
//
//  Created by Стас Жингель on 25.11.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = FetchDataStocks()
    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    SearchBar(searchData: viewModel)
                        
                    ScrollView(.vertical, showsIndicators: false) {
                        if viewModel.loading {
                            Text("Loading ...")
                        } else {
                            ForEach(viewModel.tickers, id: \.symbol) { ticker in
                                NavigationLink {
                                    TickerInfoView(ticker: ticker)
                                } label: {
                                    TickerMiniView(ticker: ticker)
                                }
                                
                            }
                        }
                    }.navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Каталог")
                }
             
            }
            .tabItem { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Item Label@*/Text("Label")/*@END_MENU_TOKEN@*/ }
            NavigationView {
                Text("second View")
            }
            .tabItem { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Item Label@*/Text("Label")/*@END_MENU_TOKEN@*/ }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


