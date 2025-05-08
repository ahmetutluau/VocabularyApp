//
//  TailorWordView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 8.05.2025.
//

import SwiftUI

struct TailorWordView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            //: BackgroundColor
            
            VStack {
                
                Text("Tailor your word recommendations")
                    .foregroundStyle(.primary)
                    .font(.system(.title, design: .serif))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                //: Title
                
                Spacer()

                Button(action: {
                    coordinator.push(page: .age)
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
            .padding(.top, ScreenSize.height / 2)
            
        } //: MainZStack
    }
}

#Preview {
    TailorWordView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .dark)

}

#Preview {
    TailorWordView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .light)

}
