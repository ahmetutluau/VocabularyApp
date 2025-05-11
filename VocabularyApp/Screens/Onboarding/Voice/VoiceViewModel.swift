//
//  File.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 10.05.2025.
//

import Foundation

final class VoiceViewModel: ObservableObject {
    let soundOptions = [
            SoundOption(name: "Brian", nationality: "American", fileName: "American_male"),
            SoundOption(name: "Mia", nationality: "American", fileName: "American_female"),
            SoundOption(name: "George", nationality: "British", fileName: "British_male"),
            SoundOption(name: "Emma", nationality: "British", fileName: "British_female")
        ]
    
    @Published var selecteRowIndex: Int = 0
    
    // MARK: - Functions
    func saveSelectedPersonVoice() {
        UserDefaultManager.shared.selectedPersonVoice = soundOptions[selecteRowIndex].fileName
    }
}
