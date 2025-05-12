//
//  ThemeView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 12.05.2025.
//

import SwiftUI

struct Theme: Codable {
    var image: String
    var textFont: String
    var textColor: String
    var textBackground: String
}

struct ThemeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    let themes = [
        Theme(image: "theme1", textFont: Font.fontToString(font: Font.system(.title3, design: .rounded)), textColor: Color.colorToString(color: .black), textBackground: Color.colorToString(color: .white)),
        Theme(image: "theme2", textFont: Font.fontToString(font: .body), textColor: Color.colorToString(color: .white),textBackground: Color.colorToString(color: .black)),
        Theme(image: "theme3", textFont: Font.fontToString(font: .callout), textColor: Color.colorToString(color: .black), textBackground: Color.colorToString(color: .white)),
        Theme(image: "theme4", textFont: Font.fontToString(font: Font.system(.title, design: .serif)), textColor: Color.colorToString(color: .white), textBackground: Color.colorToString(color: .black)),
        Theme(image: "theme5", textFont: Font.fontToString(font: .subheadline), textColor: Color.colorToString(color: .black), textBackground: Color.colorToString(color: .white)),
        Theme(image: "theme6", textFont: Font.fontToString(font: Font.system(.largeTitle, design: .monospaced)), textColor: Color.colorToString(color: .white), textBackground: Color.colorToString(color: .black))
    ]    
    @State var selectedIndex: Int = 0
    
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
                            ForEach(Array(themes.enumerated()), id: \.offset) { index, theme in
                                ThemeRow(theme: theme, isSelected: selectedIndex == index)
                                    .frame(width: (geometry.size.width - 68) / 3, height: 150)
                                    .onTapGesture {
                                        selectedIndex = index
                                    }
                            }//: Foreach
                        }//: lazyVGrid
                        
                        Button(action: {
                            UserDefaultManager.shared.selectedTheme = themes[selectedIndex]
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
