//
//  HomeView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 11.05.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var viewModel = HomeViewModel()
    private let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    @State var hasLaunchBefore: Bool = true
    
    var body: some View {
        ZStack {
            Image(UserDefaultManager.shared.selectedTheme?.image ?? "theme1")
                .resizable()
                .ignoresSafeArea()

            GeometryReader { geometry in
                ScrollView(.vertical) {
                    LazyVStack(spacing: 0) {
                        
                        if !hasLaunchBefore {
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
                                    
                                    if index == 1 {
                                        hasLaunchBefore = true
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
                                .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                                .frame(width: 13, height: 13)

                            Text("0/5")
                                .font(.subheadline)
                                .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))

                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 80, height: 8)
                                .foregroundColor(.gray)
                        }
                        .padding(10)
                        .background(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textBackground ?? "gray"))
                        .cornerRadius(20)

                        Spacer()

                        Circle()
                            .foregroundStyle(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textBackground ?? "gray"))
                            .frame(width: 60, height: 60)
                            .overlay {
                                Image(systemName: "crown")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                            }
                    }//: Hstack

                    Spacer()
                    
                    HStack {
                        if (UserDefaultManager.shared.hasLaunchedBefore ?? false) {
                            Button {
                                coordinator.push(page: .flashcard)
                            } label: {
                                HStack(spacing: 5) {
                                    Image(systemName: "graduationcap")
                                        .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                                    
                                    Text("Practice")
                                        .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                                        .font(.subheadline)
                                }
                                .padding(10)
                                .cornerRadius(20)
                            }//: Practice Button
                        }
                        
                        Spacer()
                    }


                }//: navbar
                .padding(.top, 60)
                .padding(.horizontal, 24)
                .padding(.bottom, 32)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            hasLaunchBefore = UserDefaultManager.shared.hasLaunchedBefore ?? false
        }
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
