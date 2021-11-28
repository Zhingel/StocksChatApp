//
//  SearchBar.swift
//  StocksChatApp
//
//  Created by Стас Жингель on 26.11.2021.
//


import SwiftUI

struct SearchBar: View {
    @ObservedObject var searchData: FetchDataStocks

    @State private var isEditing = false
        
    var body: some View {
        HStack {
            
            TextField("Search ...", text: $searchData.searchingText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.searchData.searchingText = ""
                                
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                .onChange(of: searchData.searchingText) { newValue in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        if newValue == searchData.searchingText {
                            print(newValue)
                            if searchData.searchingText != "" {
                                searchData.fetchData()
                            }
                        }
                    }
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.searchData.searchingText = ""
                    
                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
    }
}



