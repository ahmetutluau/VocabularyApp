//
//  GenderView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 8.05.2025.
//

import SwiftUI

struct GenderView: View {
    @EnvironmentObject private var coordinator: Coordinator
    let titles = ["Female", "Male", "Other", "Prefer not to say"]
    
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            //: BackgroundColor
            
            VStack(spacing: 50) {
                Text("Which option represents you best??")
                    .foregroundStyle(.primary)
                    .font(.system(.title, design: .serif))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 30)
                //: Title
                                
                VStack(spacing: 10) {
                    ForEach(titles, id: \.self) { title in
                        OnboardingOptionRow(title: title) {
                            
                        }//: row
                    }//: Foreach
                }//: Vstack
                
                Spacer()
            } //: MainVStack
            .padding(.horizontal, 24)
            .padding(.top, 60)

        } //: MainZStack
    }
}

#Preview {
    GenderView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .dark)

}

#Preview {
    GenderView()
        .environmentObject(Coordinator())
        .environment(\.colorScheme, .light)

}
