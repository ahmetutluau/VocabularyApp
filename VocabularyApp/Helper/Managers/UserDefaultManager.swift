//
//  UserDefaultManager.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 11.05.2025.
//

import Foundation

class UserDefaultManager {
    static let shared = UserDefaultManager()
    
    private init() {}
    
    var hasLaunchedBefore: Bool? {
        get {
            return UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: "hasLaunchedBefore")
        }
    }
    
    var selectedPersonVoice: String? {
        get {
            return UserDefaults.standard.string(forKey: "selectedPersonVoice")
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: "selectedPersonVoice")
        }
    }
}
