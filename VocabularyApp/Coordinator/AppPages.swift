//
//  AppPages.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 8.05.2025.
//

import Foundation

enum AppPages: Hashable {
    case onboardingStart
    case socialMedia
    case tailorWord
}

enum Sheet: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case placeHolder
}

enum FullScreenCover: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case placeHolder
}
