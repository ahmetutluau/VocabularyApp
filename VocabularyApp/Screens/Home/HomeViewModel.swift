//
//  HomeViewModel.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 11.05.2025.
//

import Foundation

final class HomeViewModel: ObservableObject {
    let originWords = [
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
    
    @Published var words: [Word] = [
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
    
    //pagination
    @Published var currentPage = 1 {
        didSet {
            words += originWords
        }
    }
}
