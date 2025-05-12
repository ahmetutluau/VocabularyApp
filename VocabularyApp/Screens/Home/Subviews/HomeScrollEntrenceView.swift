//
//  HomeScrollEntrenceView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 11.05.2025.
//

import SwiftUI

struct HomeScrollEntrenceView: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Text("Welcome to Vocabulary")
                .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                .font(.system(.title, design: .serif))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 24)
                .offset(y: isAnimating ? 0 : 200) 
                .animation(.easeOut(duration: 1), value: isAnimating)
            
            VStack {
                Spacer()
                
                VStack(alignment: .center, spacing: 20) {
                    Image(systemName: "chevron.up")
                        .resizable()
                        .frame(width: 40, height: 20)
                        .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                        .fontWeight(.thin)
                        .offset(y: isAnimating ? -2 : 2)
                        .animation(
                            Animation.easeInOut(duration: 0.5)
                                .repeatForever(autoreverses: true), value: isAnimating
                        )
                        .onAppear {
                            isAnimating = true
                        }
                    
                    Text("Swipe up")
                        .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                        .font(.body)
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 32)
            }

        } //: MainZStack
        .ignoresSafeArea()
        .background(.clear)
    }
}

#Preview {
    HomeScrollEntrenceView()
        .environment(\.colorScheme, .dark)
}

#Preview {
    HomeScrollEntrenceView()
        .environment(\.colorScheme, .light)
}
