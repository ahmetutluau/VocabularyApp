//
//  HomeView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 11.05.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    private let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        ZStack {
            Color.onboardingBackground
                .ignoresSafeArea()

            GeometryReader { geometry in
                ScrollView(.vertical) {
                    LazyVStack(spacing: 0) {
                        
                        if !(UserDefaultManager.shared.hasLaunchedBefore ?? false) {
                            HomeScrollEntrenceView()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                        }

                        ForEach(Array(viewModel.words.enumerated()), id: \.offset) { index, word in
                            HomeRowView(word: word)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .onAppear {
                                    if index == (viewModel.words.count - 1) {
                                        viewModel.currentPage += 1
                                    }
                                    if index == 2 {
                                        UserDefaultManager.shared.hasLaunchedBefore = true
                                    }
                                }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.paging)
                .onChange(of: viewModel.currentPage) { _, _ in
                    feedbackGenerator.prepare()
                    feedbackGenerator.impactOccurred()
                }

                VStack {
                    HStack {
                        Circle()
                            .frame(width: 60, height: 60)
                            .opacity(0)

                        Spacer()

                        HStack(alignment: .center, spacing: 8) {
                            Image(systemName: "bookmark")
                                .resizable()
                                .frame(width: 13, height: 13)

                            Text("0/5")
                                .font(.subheadline)

                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 80, height: 8)
                                .foregroundColor(.secondary)
                        }
                        .padding(10)
                        .background(.voiceRowBackground)
                        .cornerRadius(20)

                        Spacer()

                        Circle()
                            .foregroundStyle(.voiceRowBackground)
                            .frame(width: 60, height: 60)
                            .overlay {
                                Image(systemName: "crown")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(.primary)
                            }
                    }
                    .padding(.horizontal, 24)

                    Spacer()
                }
                .padding(.top, 60)
            }
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    HomeView()
        .environment(\.colorScheme, .dark)

}

#Preview {
    HomeView()
        .environment(\.colorScheme, .light)

}
