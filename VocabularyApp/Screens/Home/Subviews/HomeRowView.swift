//
//  HomeRowView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 11.05.2025.
//

import SwiftUI

struct Word {
    let title: String
    var pronounce: String
    let soundFile: String
    let description: String
    let example: String
}

struct HomeRowView: View {
    var word: Word
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            VStack(spacing: 10) {
                Text(word.title)
                    .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                    .font(Font.stringToFont(fontString: UserDefaultManager.shared.selectedTheme?.textFont ?? "title"))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                HStack(spacing: 5) {
                    Text(word.pronounce)
                        .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                        .font(.subheadline)
                    
                    Button {
                        AudioManager.shared.playSound(fileName: word.soundFile, onFinish: {})
                    } label: {
                        Image(systemName: "speaker.wave.2")
                            .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                    }
                }
                .padding(10)
                .background(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textBackground ?? "gray"))
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 2)
            }

            Text(word.description)
                .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                .font(.body)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Text(word.example)
                .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.horizontal, 24)
        .background(.clear)
        
    }
}

#Preview {
    ZStack {
        Color.gray
        
        HomeRowView(word: Word(title: "indelible", pronounce: "In'd&labal", soundFile: "American_female", description: "(adj.) Impossible to erase or forget", example: "Her smile left an indelible mark on his heart."))
    }
}
