//
//  View+Ext.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 11.05.2025.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
