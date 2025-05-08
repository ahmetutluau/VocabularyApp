//
//  SocialMediaView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 8.05.2025.
//

import SwiftUI

struct SocialMediaView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State private var isNavigating = false
    let titles = ["Web search", "Instagram", "TikTok", "Friend/family", "App Store", "Facebook", "Other"]
    
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            //: BackgroundColor
            
            VStack(spacing: 40) {
                Text("How did you hear about Vocabulary?")
                    .foregroundColor(.primary)
                    .font(.system(.title, design: .serif))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 30)
                //: Title
                                
                VStack(spacing: 15) {
                    ForEach(titles, id: \.self) { title in
                        OnboardingOptionRow(title: title) {
                            // Prevent multiple taps
                            guard !isNavigating else { return }
                            isNavigating = true
                            
                            Task {
                                try? await Task.sleep(nanoseconds: 500_000_000)
                                coordinator.push(page: .tailorWord1)
                                isNavigating = false
                            }
                        }//: row
                        .disabled(isNavigating)
                    }//: Foreach
                }//: Vstack
                
                Spacer()

            } //: MainVStack
            .padding(.horizontal, 24)
            .padding(.top, 50)

        } //: MainZStack
    }
}

#Preview("Light Mode") {
    SocialMediaView()
        .environmentObject(Coordinator())
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    SocialMediaView()
        .environmentObject(Coordinator())
        .preferredColorScheme(.dark)
}
