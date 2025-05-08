//
//  OnboardingStartView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 8.05.2025.
//

import SwiftUI

struct OnboardingStartView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        VStack {
            Spacer()
            
            Text("Onboarding start page")
            
            Spacer()
            
            Button {
                coordinator.push(page: .socialMedia)
            } label: {
                Text("go to social media page")
            }

        }
        
        
    }
}

#Preview {
    OnboardingStartView()
}
