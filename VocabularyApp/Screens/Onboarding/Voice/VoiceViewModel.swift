//
//  File.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 10.05.2025.
//

import Foundation

final class VoiceViewModel: ObservableObject {
    let soundOptions = [
            SoundOption(name: "Brian", nationality: "American", fileName: "American_Male"),
            SoundOption(name: "Mia", nationality: "American", fileName: "American_Female"),
            SoundOption(name: "George", nationality: "American", fileName: "British_Male"),
            SoundOption(name: "Emma", nationality: "American", fileName: "British_Female"),
            SoundOption(name: "Oliver", nationality: "American", fileName: "Australian_Male"),
            SoundOption(name: "Mathilda", nationality: "American", fileName: "Austrlian_Female")
        ]
    
    @Published var selecteRowIndex: Int = 0
}
