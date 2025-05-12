//
//  AudioManager.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 12.05.2025.
//

import AVFoundation

final class AudioManager: NSObject, AVAudioPlayerDelegate {
    static let shared = AudioManager()
    
    private var player: AVAudioPlayer?
    var onFinish: (() -> Void)?

    private override init() {}

    func playSound(fileName: String, onFinish: @escaping () -> Void) {
        stop()
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("Audio file not found: \(fileName).mp3")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            player?.play()
            self.onFinish = onFinish
        } catch {
            print("Audio playback error: \(error)")
        }
    }

    func stop() {
        player?.stop()
        player = nil
        onFinish?()
        onFinish = nil
    }

    func isPlaying() -> Bool {
        player?.isPlaying ?? false
    }

    func currentTime() -> TimeInterval {
        player?.currentTime ?? 0
    }

    func duration() -> TimeInterval {
        player?.duration ?? 1
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        onFinish?()
        onFinish = nil
    }
}
