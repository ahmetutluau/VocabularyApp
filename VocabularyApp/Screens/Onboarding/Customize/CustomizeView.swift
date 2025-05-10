//
//  CustomizeView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 10.05.2025.
//

import SwiftUI

struct CustomizeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            //: BackgroundColor
            
            VStack {
                Text("Customize the app to improve your experience")
                    .foregroundColor(.primary)
                    .font(.system(.title, design: .serif))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                //: Title
                
                Spacer()

                Button(action: {
                    
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
            .padding(.top, ScreenSize.height / 2)
            
        } //: MainZStack
    }
}

#Preview {
    CustomizeView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .dark)

}

#Preview {
    CustomizeView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .light)

}
