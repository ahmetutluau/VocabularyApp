//
//  OnboardingStartView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 8.05.2025.
//

import SwiftUI

struct OnboardingStartView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()
            //: BackgroundColor
            
            VStack {
                
                VStack(alignment: .center, spacing: 20) {
                    Text("Expand your Vocabulary in 1 minute a day")
                        .foregroundColor(.primary)
                        .font(.system(.title, design: .serif))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                    //: TitleText

                    Text("Learn 10,000+ new words with a new daily habit that takes just 1 minute")
                        .foregroundColor(.primary)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                    //: SubtitleText
                }
                //: HeaderVStack

                Spacer()

                HStack(alignment: .center) {

                    VStack {
                        Text("350 million")
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .font(.body)
                            .frame(maxWidth: .infinity)
                        //: LeftNumberText

                        Text("words learned")
                            .font(.caption)
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                        //: LeftLabel
                    }
                    //: LeftStatVStack

                    Spacer()

                    HStack(alignment: .center, spacing: 5) {
                        Image(systemName: "laurel.leading")
                            .resizable()
                            .frame(width: 20, height: 60)
                        //: LeftLaurel

                        VStack(spacing: 0) {
                            Text("4.8")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .frame(maxWidth: .infinity, alignment: .center)
                            //: RatingText

                            HStack(spacing: 2) {
                                ForEach(0..<5) { _ in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .foregroundColor(Color.yellow)
                                }
                            }
                            //: StarRow
                        }
                        //: RatingVStack

                        Image(systemName: "laurel.trailing")
                            .resizable()
                            .frame(width: 20, height: 60)
                        //: RightLaurel
                    }
                    //: RatingHStack

                    Spacer()

                    VStack {
                        Text("10 million")
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                        //: RightNumberText

                        Text("downloads")
                            .font(.caption)
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                        //: RightLabel
                    }
                    //: RightStatVStack
                }
                //: StatsHStack

                Spacer()

                Button(action: {
                    coordinator.push(page: .socialMedia)
                }) {
                    Text("Get started")
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
            .padding(.top, ScreenSize.height / 2.5)
            
        } //: MainZStack
    }
}


#Preview("Light Mode") {
    OnboardingStartView()
        .environmentObject(Coordinator())
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    OnboardingStartView()
        .environmentObject(Coordinator()) 
        .preferredColorScheme(.dark)
}
