//
//  ThemeView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 12.05.2025.
//

import SwiftUI

struct ThemeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var viewModel = ThemeViewModel()
    
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            //: BackgroundColor
            
            GeometryReader { geometry in
                VStack {
                    Text("Which theme would you like to start with?")
                        .foregroundColor(.primary)
                        .font(.system(.title, design: .serif))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal, 30)
                    //: Title

                    Spacer()
                    
                    VStack(spacing: 50) {
                        LazyVGrid(columns: Array(repeating: .init(), count: 3), spacing: 20) {
                            ForEach(Array(viewModel.themes.enumerated()), id: \.offset) { index, theme in
                                ThemeRow(theme: theme, isSelected: viewModel.selectedIndex == index)
                                    .frame(height: 150)
                                    .onTapGesture {
                                        viewModel.selectedIndex = index
                                    }
                            }//: Foreach
                        }//: lazyVGrid
                        
                        Button(action: {
                            viewModel.saveSelectedTheme()
                            coordinator.push(page: .voice)
                        }) {
                            Text("Continue")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .background(
                                    Capsule()
                                        .fill(Color(red: 169/255, green: 208/255, blue: 203/255))
                                        .shadow(color: .black, radius: 0, x: 0, y: 3)
                                )
                                .overlay(
                                    Capsule()
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            //: ButtonLabel
                        }//: StartButton
                        .padding(.bottom, 32)
                    }
                } //: MainVStack
                .padding(.horizontal, 24)
                .padding(.top, 60)
            }//: GeometryReader
        } //: MainZStack
    }
}

#Preview {
    ThemeView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .dark)

}

#Preview {
    ThemeView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .light)

}
