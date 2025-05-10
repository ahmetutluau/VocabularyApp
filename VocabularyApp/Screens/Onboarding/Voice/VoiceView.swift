//
//  VoiceView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 9.05.2025.
//

import SwiftUI

struct VoiceView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var viewModel = VoiceViewModel()
    
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            //: BackgroundColor
            
            VStack {
                Text("Choose a voice to pronounce words?")
                    .foregroundColor(.primary)
                    .font(.system(.title, design: .serif))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ForEach(Array(viewModel.soundOptions.enumerated()), id: \.offset) { index, option in
                    VoiceRowView(soundOption: option, isSelected: index == viewModel.selecteRowIndex) {
                        viewModel.selecteRowIndex = index
                    }//: row
                }//: foreach
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("Save voice selection")
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
                
            }//: MainVStack
            .padding(.horizontal)
        }
    }
}

#Preview {
    VoiceView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .dark)

}

#Preview {
    VoiceView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .light)

}
