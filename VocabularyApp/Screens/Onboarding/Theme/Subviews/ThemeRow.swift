//
//  ThemeRow.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 11.05.2025.
//

import SwiftUI

struct ThemeRow: View {
    var theme: Theme
    var isSelected: Bool
    
    var body: some View {
        Image(theme.image)
            .resizable()
            .cornerRadius(15)
            .overlay(alignment: .center, content: {
                Text("Aa")
                    .font(Font.stringToFont(fontString: theme.textFont))
                    .foregroundColor(Color.stringToColor(colorString: theme.textColor))
            })
            .overlay(alignment: .topTrailing) {
                if isSelected {
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.clear)
                        .overlay {
                            Circle()
                                .stroke(Color.primary, lineWidth: isSelected ? 0 : 1)
                        }
                        .overlay(content: {
                            Circle()
                                .foregroundColor(isSelected ? Color(red: 169/255, green: 208/255, blue: 203/255) : .clear)
                        })
                        .overlay {
                            if isSelected {
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .frame(width: 8, height: 8)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(10)
                    
                }
            }
    }
}

#Preview {
    ThemeRow(theme: Theme(image: "theme1", textFont: "body", textColor: "black", textBackground: "white"), isSelected: true)
        .frame(width: 100, height: 150)
        .cornerRadius(15)

}
