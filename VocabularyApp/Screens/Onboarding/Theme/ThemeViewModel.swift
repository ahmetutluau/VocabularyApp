//
//  ThemeViewModel.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 12.05.2025.
//

import SwiftUI

struct Theme: Codable {
    var image: String
    var textFont: String
    var textColor: String
    var textBackground: String
}

final class ThemeViewModel: ObservableObject {
    @Published var selectedIndex: Int = 0
    
    let themes = [
        Theme(image: "theme1", textFont: Font.fontToString(font: Font.system(.title3, design: .rounded)), textColor: Color.colorToString(color: .black), textBackground: Color.colorToString(color: .white)),
        Theme(image: "theme2", textFont: Font.fontToString(font: .body), textColor: Color.colorToString(color: .white),textBackground: Color.colorToString(color: .black)),
        Theme(image: "theme3", textFont: Font.fontToString(font: .callout), textColor: Color.colorToString(color: .black), textBackground: Color.colorToString(color: .white)),
        Theme(image: "theme4", textFont: Font.fontToString(font: Font.system(.title, design: .serif)), textColor: Color.colorToString(color: .white), textBackground: Color.colorToString(color: .black)),
        Theme(image: "theme5", textFont: Font.fontToString(font: .subheadline), textColor: Color.colorToString(color: .black), textBackground: Color.colorToString(color: .white)),
        Theme(image: "theme6", textFont: Font.fontToString(font: Font.system(.largeTitle, design: .monospaced)), textColor: Color.colorToString(color: .white), textBackground: Color.colorToString(color: .black))
    ]
    
    // MARK: - Functions
    func saveSelectedTheme() {
        UserDefaultManager.shared.selectedTheme = themes[selectedIndex]
    }
}
