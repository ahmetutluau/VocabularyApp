//
//  Font+Ext.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 11.05.2025.
//

import SwiftUI

extension Font {
    
    static func fontToString(font: Font) -> String {
        switch font {
        case .system(.title3, design: .rounded):
            return "title3-rounded"
        case .body:
            return "body"
        case .callout:
            return "callout"
        case .system(.title, design: .serif):
            return "title-serif"
        case .subheadline:
            return "subheadline"
        case .system(.largeTitle, design: .monospaced):
            return "largeTitle-monospaced"
        default:
            return "unknown"
        }
    }

    static func stringToFont(fontString: String) -> Font {
        switch fontString {
        case "title3-rounded":
            return .system(.title3, design: .rounded)
        case "body":
            return .body
        case "callout":
            return .callout
        case "title-serif":
            return .system(.title, design: .serif)
        case "subheadline":
            return .subheadline
        case "largeTitle-monospaced":
            return .system(.largeTitle, design: .monospaced)
        default:
            return .body
        }
    }
}
