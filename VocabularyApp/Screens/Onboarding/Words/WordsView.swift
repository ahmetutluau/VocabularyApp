//
//  WordsView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 8.05.2025.
//

import SwiftUI

struct WordsView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State private var isNavigating = false
    let titles = ["10 words a week", "30 words a week", "50 words a week"]
    
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            //: BackgroundColor
            
            VStack(spacing: 30) {
                Button {
                    coordinator.push(page: .vocabularyLevel)
                } label: {
                    Text("Skip")
                        .foregroundColor(.primary)
                        .font(.system(.callout))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal, 20)
                }//: Skip button
                
                VStack(spacing: 50) {
                    Text("How many words do you want to learn per week?")
                        .foregroundColor(.primary)
                        .font(.system(.title, design: .serif))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                    //: Title
                                    
                    VStack(spacing: 15) {
                        ForEach(titles, id: \.self) { title in
                            OnboardingOnlyOptionRow(title: title) {
                                // Prevent multiple taps
                                guard !isNavigating else { return }
                                isNavigating = true
                                
                                Task {
                                    try? await Task.sleep(nanoseconds: 500_000_000)
                                    coordinator.push(page: .vocabularyLevel)
                                    isNavigating = false
                                }
                            }//: row
                            .disabled(isNavigating)
                        }//: Foreach
                    }//: Vstack
                    
                    Spacer()
                }

            } //: MainVStack
            .padding(.horizontal, 24)
            .padding(.top, 30)

        } //: MainZStack
    }
}

#Preview {
    WordsView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .dark)

}

#Preview {
    WordsView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .light)

}
