//
//  VoiceRowView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 10.05.2025.
//

import SwiftUI

struct SoundOption: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let nationality: String
    let fileName: String
}

struct VoiceRowView: View {
    let soundOption: SoundOption
    var isSelected: Bool
    @StateObject private var viewModel = VoiceRowViewModel()
    let totalBars = 40
    var didSelectButtonClicked: () -> Void

    var body: some View {
        HStack {
            HStack(spacing: 20) {
                Button {
                    viewModel.togglePlayPause(fileName: soundOption.fileName)
                } label: {
                    Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primary)
                }
                
                VStack(spacing: 2) {
                    Text(soundOption.name)
                        .foregroundColor(.primary)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(soundOption.nationality)
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }

            Spacer()
            
            HStack(spacing: 10) {
                ProgressBarView(progress: viewModel.progress, totalBars: totalBars)
                
                Button(action: {
                    didSelectButtonClicked()
                }, label: {
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
                })
            }
        }
        .padding()
        .background(.voiceRowBackground)
        .cornerRadius(10)
    }
}

#Preview {
    ZStack {
        Color.red
        
        VoiceRowView(soundOption: SoundOption(name: "Jack", nationality: "American", fileName: ""), isSelected: false, didSelectButtonClicked: {})
    }
}
