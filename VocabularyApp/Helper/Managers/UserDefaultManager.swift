//
//  UserDefaultManager.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 11.05.2025.
//

import SwiftUI

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
    
    var selectedTheme: Theme? {
        get {
            if let data = UserDefaults.standard.data(forKey: "selectedTheme") {
                let decoder = JSONDecoder()
                do {
                    let theme = try decoder.decode(Theme.self, from: data)
                    return theme
                } catch {
                    print("Error decoding theme: \(error)")
                }
            }
            return nil
        }
        set(newValue) {
            let encoder = JSONEncoder()
            if let theme = newValue {
                do {
                    let data = try encoder.encode(theme)
                    UserDefaults.standard.set(data, forKey: "selectedTheme")
                } catch {
                    print("Error encoding theme: \(error)")
                }
            } else {
                UserDefaults.standard.removeObject(forKey: "selectedTheme")
            }
        }
    }
}
