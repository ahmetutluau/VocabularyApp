//
//  NameView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 8.05.2025.
//

import SwiftUI

struct NameView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State var nameTextInput: String = ""
    
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            //: BackgroundColor
            
            VStack(spacing: 30) {
                Button {
                    coordinator.push(page: .tailorWord2)
                } label: {
                    Text("Skip")
                        .foregroundColor(.primary)
                        .font(.system(.callout))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal, 20)
                }//: Skip button

                
                VStack(spacing: 80) {
                    Text("What do you want to be called?")
                        .foregroundColor(.primary)
                        .font(.system(.title, design: .serif))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal, 30)
                    //: Title
                    
                    TextField("Your name", text: $nameTextInput)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .background(.textFieldBackground)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                }
                
                Spacer()
                
                Button(action: {
                    coordinator.push(page: .tailorWord2)
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
                }
                .padding(.bottom, 32)
                //: StartButton
                
            } //: MainVStack
            .padding(.horizontal, 24)
            .padding(.top, 30)

        } //: MainZStack
    }
}

#Preview {
    NameView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .dark)

}

#Preview {
    NameView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .light)

}
