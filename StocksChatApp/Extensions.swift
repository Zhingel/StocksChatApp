//
//  Extensions.swift
//  StocksChatApp
//
//  Created by Стас Жингель on 26.11.2021.
//

import SwiftUI

extension Color {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> Color {
       return Color(red: red/255, green: green/255, blue: blue/255, opacity: 1)
    }
}
