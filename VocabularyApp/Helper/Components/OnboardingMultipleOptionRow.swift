//
//  OnboardingMultipleOptionRow.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 10.05.2025.
//

import SwiftUI

struct OnboardingMultipleOptionRow: View {
    var title: String
    @Binding var isSelected: Bool

    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 50)
                .font(.title3)
            
            Spacer()
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.clear)
                .overlay {
                    Circle()
                        .stroke(Color.secondary, lineWidth: isSelected ? 0 : 1)
                }
                .overlay(content: {
                    Circle()
                        .foregroundColor(isSelected ? Color(red: 169/255, green: 208/255, blue: 203/255) : .clear)
                })
                .overlay {
                    if isSelected {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.black)
                    }
                }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
        .overlay {
            Capsule()
                .stroke(isSelected ? .primary : .secondary, lineWidth: 1)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                isSelected.toggle()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.onboardingBackground
            .ignoresSafeArea()
        
        OnboardingMultipleOptionRow(title: "Instagram", isSelected: .constant(false))
    }
    .environment(\.colorScheme, .light)
}

#Preview {
    ZStack {
        Color.onboardingBackground
            .ignoresSafeArea()
        
        OnboardingMultipleOptionRow(title: "Instagram", isSelected: .constant(false))
    }
    .environment(\.colorScheme, .dark)
}

