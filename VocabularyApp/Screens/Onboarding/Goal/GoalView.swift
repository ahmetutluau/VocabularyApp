//
//  GoalView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 10.05.2025.
//

import SwiftUI

struct GoalView: View {
    @EnvironmentObject private var coordinator: Coordinator
    let titles = ["Improve my job prospects", "Enjoy learning new words", "Get ready for a test", "Enhance my lexicon", "Other"]
    @State var isSelecteds: [Bool]
    
    init() {
        _isSelecteds = State(initialValue: Array(repeating: false, count: titles.count))
    }
    
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            //: BackgroundColor
            
            VStack(spacing: 50) {
                Text("Do you have a specific goal in mind?")
                    .foregroundColor(.primary)
                    .font(.system(.title, design: .serif))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 30)
                //: Title
                
                VStack(spacing: 15) {
                    ForEach(titles.indices, id: \.self) { index in
                        OnboardingMultipleOptionRow(title: titles[index],
                                                    isSelected: $isSelecteds[index])//: row
                    }//: Foreach
                }//: Vstack
                
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
                                .opacity(!isSelecteds.contains(true) ? 0.6 : 1)
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
    GoalView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .dark)

}

#Preview {
    GoalView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .light)

}
