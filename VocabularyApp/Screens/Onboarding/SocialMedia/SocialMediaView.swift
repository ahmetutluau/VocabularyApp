//
//  SocialMediaView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 8.05.2025.
//

import SwiftUI

struct SocialMediaView: View {
    @EnvironmentObject private var coordinator: Coordinator
    let titles = ["Web search", "Instagram", "TikTok", "Friend/family", "App Store", "Facebook", "Other"]
    
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            //: BackgroundColor
            
            VStack(spacing: 50) {
                Text("How did you hear about Vocabulary?")
                    .foregroundStyle(.primary)
                    .font(.system(.title, design: .serif))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 30)
                //: Title
                                
                VStack(spacing: 10) {
                    ForEach(titles, id: \.self) { title in
                        OnboardingOptionRow(title: title) {
                            coordinator.push(page: .tailorWord)
                        }//: row
                    }//: Foreach
                }//: Vstack
                
                Spacer()

            } //: MainVStack
            .padding(.horizontal, 24)
            .padding(.top, 60)

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
