//
//  TopicView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 10.05.2025.
//

import SwiftUI

struct TopicView: View {
    @EnvironmentObject private var coordinator: Coordinator
    let titles = ["Human body", "Society", "Emotions", "Words in foreign languages", "Other"]
    @State var isSelecteds: [Bool]
    
    init() {
        _isSelecteds = State(initialValue: Array(repeating: false, count: titles.count))
    }
    
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            //: BackgroundColor
            
            VStack {
                VStack(spacing: 50) {
                    Text("Which topics are you interested in?")
                        .foregroundColor(.primary)
                        .font(.system(.title, design: .serif))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal, 10)
                    //: Title
                    
                    VStack(spacing: 15) {
                        ForEach(titles.indices, id: \.self) { index in
                            OnboardingMultipleOptionRow(title: titles[index],
                                                        isSelected: $isSelecteds[index])//: row
                        }//: Foreach
                    }//: Vstack
                }
                
                Spacer()
                
                Button(action: {
                    coordinator.push(page: .home)
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
                                .opacity(!isSelecteds.contains(true) ? 0.4 : 1)
                        )
                        .overlay(
                            Capsule()
                                .stroke(Color.black, lineWidth: 1)
                        )
                    //: ButtonLabel
                }//: StartButton
                .padding(.bottom, 32)
                .disabled(!isSelecteds.contains(true))

            } //: MainVStack
            .padding(.horizontal, 24)
            .padding(.top, 60)

        } //: MainZStack
    }
}

#Preview {
    TopicView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .dark)

}

#Preview {
    TopicView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .light)

}
