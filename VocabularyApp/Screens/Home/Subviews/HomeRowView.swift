//
//  HomeRowView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 11.05.2025.
//

import SwiftUI
import AVFoundation

struct Word {
    let title: String
    var pronounce: String
    let soundFile: String
    let description: String
    let example: String
}

struct HomeRowView: View {
    var word: Word
    @State private var player: AVAudioPlayer?
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            VStack(spacing: 10) {
                Text(word.title)
                    .foregroundColor(.primary)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                HStack(spacing: 5) {
                    Text(word.pronounce)
                        .foregroundColor(.primary)
                        .font(.subheadline)
                    
                    Button {
                        playSound()
                    } label: {
                        Image(systemName: "speaker.wave.2")
                            .foregroundColor(.primary)
                    }
                }
                .padding(10)
                .background(.voiceRowBackground)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 2)
            }

            Text(word.description)
                .foregroundColor(.primary)
                .font(.body)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Text(word.example)
                .foregroundColor(.primary)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.horizontal, 24)
        
    }
    
    // MARK: - Helper Functions
    private func playSound() {
        guard let url = Bundle.main.url(forResource: word.soundFile, withExtension: "mp3") else {
            print("Sound file not found")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ZStack {
        Color.gray
        
        HomeRowView(word: Word(title: "indelible", pronounce: "In'd&labal", soundFile: "American_Female", description: "(adj.) Impossible to erase or forget", example: "Her smile left an indelible mark on his heart."))
    }
}
