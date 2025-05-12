//
//  FlashcardViewModel.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 12.05.2025.
//

import SwiftUI

final class FlashcardViewModel: ObservableObject {
    let durationAnddelay: CGFloat = 0.2
    
    // MARK: - State Properties
    @Published var backDegree = 90.0
    @Published var frontDegree = 0.0
    @Published var isFlipped = false
    @Published var flashCardIndex = 0
    @Published var isAlertPresented: Bool = false
    @Published var alertMessage: String = ""
    
    @Published var flashCards: [Word] = [
        Word(title: "altruistic",
             pronounce: "ɪnˈdɛl.ə.bəl",
             soundFile: "\(UserDefaultManager.shared.selectedPersonVoice ?? "")_word1",
             description: "(adj.) Caring for others without expecting anything in return",
             example: "His altruistic actions earned him much respect."),
        Word(title: "indelible",
             pronounce: "In'd&labal",
             soundFile: "\(UserDefaultManager.shared.selectedPersonVoice ?? "")_word2",
             description: "(adj.) Impossible to erase or forget",
             example: "Her smile left an indelible mark on his heart."),
        Word(title: "callow",
             pronounce: "ˈkæloʊ",
             soundFile: "\(UserDefaultManager.shared.selectedPersonVoice ?? "")_word3",
             description: "(adj.) Inexperienced or immature",
             example: "The callow intern was eager to learn."),
        Word(title: "ineffable",
             pronounce: "ɪˈnɛf.ə.bəl/",
             soundFile: "\(UserDefaultManager.shared.selectedPersonVoice ?? "")_word4",
             description: "(adj.) Too great or extreme to be expressed or described in words",
             example: "The ineffable beauty of the sunset left them speechless."),
        Word(title: "sedulous",
             pronounce: "ˈsɛdʒ.ə.ləs",
             soundFile: "\(UserDefaultManager.shared.selectedPersonVoice ?? "")_word5",
             description: "(adj.) Working hard and never giving up",
             example: "Her sedulous study habits paid off.")
    ]
    
    // MARK: - Functions
    func shuffleFlashCards() {
        flashCards.shuffle()
        flashCardIndex = 0
        resetCardToFront()
    }
    
    func flipCard() {
        isFlipped.toggle()

        if isFlipped {
            withAnimation(.linear(duration: durationAnddelay)) {
                frontDegree = -90 // hide front
            }
            withAnimation(.linear(duration: durationAnddelay).delay(durationAnddelay)) {
                backDegree = 0 // show back
            }
        } else {
            withAnimation(.linear(duration: durationAnddelay)) {
                backDegree = 90 // hide back
            }
            withAnimation(.linear(duration: durationAnddelay).delay(durationAnddelay)) {
                frontDegree = 0 // show front
            }
        }
        
        triggerHapticFeedback()
    }
    
    func resetCardToFront() {
        withAnimation(.linear(duration: durationAnddelay)) {
            frontDegree = 0
            backDegree = 90
        }
        isFlipped = false
    }
    
    private func triggerHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }
}
