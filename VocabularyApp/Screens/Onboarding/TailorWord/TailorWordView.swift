//
//  TailorWordView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 8.05.2025.
//

import SwiftUI

struct TailorWordView: View {
    @EnvironmentObject private var coordinator: Coordinator
    var imageName: String
    var continueButtonTapped: () -> Void
    
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            //: BackgroundColor
            
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: ScreenSize.height / 3)
                
                Spacer()
                
                Text("Tailor your word recommendations")
                    .foregroundColor(.primary)
                    .font(.system(.title, design: .serif))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                //: Title
                
                Spacer()

                Button(action: {
                    continueButtonTapped()
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
                
            } //: MainVStack
            .padding(.horizontal, 24)
            .padding(.top, 60)
            
        } //: MainZStack
    }
}

#Preview {
    TailorWordView(imageName: "tailorWordImage1", continueButtonTapped: {})
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .dark)

}

#Preview {
    TailorWordView(imageName: "tailorWordImage2", continueButtonTapped: {})
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .light)

}
