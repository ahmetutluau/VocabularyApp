//
//  Color+Ext.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 11.05.2025.
//

import SwiftUI

extension Color {
    static func colorToString(color: Color) -> String {
        switch color {
        case .black:
            return "black"
        case .white:
            return "white"
        case .primary:
            return "primary"
        case .secondary:
            return "secondary"
        case .gray:
            return "gray"
        default:
            return "unknown"
        }
    }
    
    static func stringToColor(colorString: String) -> Color {
        switch colorString {
        case "black":
            return .black
        case "white":
            return .white
        case "primary":
            return .primary
        case "secondary":
            return .secondary
        case "gray":
            return .gray
        default:
            return .black
        }
    }
}
