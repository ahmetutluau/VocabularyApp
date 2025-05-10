//
//  VoiceRowViewModel.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 10.05.2025.
//

import SwiftUI
import AVFoundation

class VoiceRowViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var isPlaying = false
    @Published var progress: CGFloat = 0.0

    private var player: AVAudioPlayer?
    private var timer: Timer?

    func togglePlayPause(fileName: String) {
        if isPlaying {
            pause()
        } else {
            guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
                print("Audio file not found: \(fileName).mp3")
                return
            }
            play(url: url)
        }
    }

    private func play(url: URL) {
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            player?.prepareToPlay()
            player?.play()
            isPlaying = true
            startTimer()
        } catch {
            print("Audio playback error: \(error)")
        }
    }

    private func pause() {
        player?.pause()
        isPlaying = false
        stopTimer()
    }

    private func stop() {
        player?.stop()
        isPlaying = false
        progress = 0.0
        stopTimer()
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
        progress = 1.0
        stopTimer()
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] _ in
            guard let self = self, let player = self.player else { return }
            self.progress = CGFloat(player.currentTime / player.duration)
        }
        guard let player = self.player else { return }
        self.progress = CGFloat(player.currentTime / player.duration)
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
