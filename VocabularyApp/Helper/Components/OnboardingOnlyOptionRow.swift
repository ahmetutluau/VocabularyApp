//
//  OnboardingOptionRow.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 8.05.2025.
//

import SwiftUI

struct OnboardingOnlyOptionRow: View {
    var title: String
    var buttonTapped: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 50)
                .font(.title3)
            
            Spacer()
            
            if isPressed {
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.secondary)
                    .overlay {
                        Circle()
                            .foregroundColor(.black)
                            .frame(width: 10, height: 10)
                    }
            } else {
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.clear)
                    .overlay {
                        Circle()
                            .stroke(.tertiary, lineWidth: 1)
                    }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
        .overlay {
            Capsule()
                .stroke(isPressed ? .primary : .secondary, lineWidth: 1)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            buttonTapped()
            withAnimation {
                isPressed.toggle()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.onboardingBackground
            .ignoresSafeArea()
        
        OnboardingOnlyOptionRow(title: "Instagram", buttonTapped: {})
    }
    .environment(\.colorScheme, .light)
}

#Preview {
    ZStack {
        Color.onboardingBackground
            .ignoresSafeArea()
        
        OnboardingOnlyOptionRow(title: "Instagram", buttonTapped: {})
    }
    .environment(\.colorScheme, .dark)
}


