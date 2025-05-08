//
//  AgeView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 8.05.2025.
//

import SwiftUI

struct AgeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State private var isNavigating = false
    let titles = ["13 to 17", "18 to 24", "25 to 34", "35 to 44", "45 to 54", "55+"]
    
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            //: BackgroundColor
            
            VStack(spacing: 30) {
                Button {
                    coordinator.push(page: .gender)
                } label: {
                    Text("Skip")
                        .foregroundColor(.primary)
                        .font(.system(.callout))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal, 20)
                }//: Skip button

                
                VStack(spacing: 50) {
                    Text("How old are you?")
                        .foregroundColor(.primary)
                        .font(.system(.title, design: .serif))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal, 30)
                    //: Title
                                    
                    VStack(spacing: 10) {
                        ForEach(titles, id: \.self) { title in
                            OnboardingOptionRow(title: title) {
                                // Prevent multiple taps
                                guard !isNavigating else { return }
                                isNavigating = true
                                
                                Task {
                                    try? await Task.sleep(nanoseconds: 500_000_000)
                                    coordinator.push(page: .gender)
                                    isNavigating = false
                                }
                            }//: row
                            .disabled(isNavigating)
                        }//: Foreach
                    }//: Vstack
                    
                    Spacer()
                }

            } //: MainVStack
            .padding(.horizontal, 24)
            .padding(.top, 30)

        } //: MainZStack
    }
}

#Preview {
    AgeView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .dark)

}

#Preview {
    AgeView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .light)

}
