//
//  VoiceRowViewModel.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 10.05.2025.
//

import SwiftUI

class VoiceRowViewModel: ObservableObject {
    @Published var isPlaying = false
    @Published var progress: CGFloat = 0.0

    private var timer: Timer?
    private var fileName: String = ""

    func togglePlayPause(fileName: String) {
        if isPlaying {
            AudioManager.shared.stop()
            stopTimer()
            isPlaying = false
        } else {
            self.fileName = fileName
            isPlaying = true
            AudioManager.shared.playSound(fileName: fileName) { [weak self] in
                self?.isPlaying = false
                self?.progress = 0.0
                self?.stopTimer()
            }
            startTimer()
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            let current = AudioManager.shared.currentTime()
            let duration = AudioManager.shared.duration()
            self.progress = CGFloat(current / duration)
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
