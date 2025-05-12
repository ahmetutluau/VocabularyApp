//
//  Coordinator.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 8.05.2025.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    func push(page: AppPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func presentFullScreenCover(_ cover: FullScreenCover) {
        self.fullScreenCover = cover
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: AppPages) -> some View {
        switch page {
        case .onboardingStart:
            OnboardingStartView()
                .navigationBarBackButtonHidden()
        case .socialMedia:
            SocialMediaView()
                .navigationBarBackButtonHidden()
        case .tailorWord1:
            TailorWordView(imageName: "tailorWordImage1") {
                self.push(page: .age)
            }
            .navigationBarBackButtonHidden()
        case .age:
            AgeView()
                .navigationBarBackButtonHidden()
        case .gender:
            GenderView()
                .navigationBarBackButtonHidden()
        case .name:
            NameView()
                .navigationBarBackButtonHidden()
        case .tailorWord2:
            TailorWordView(imageName: "tailorWordImage1") {
                self.push(page: .words)
            }
            .navigationBarBackButtonHidden()
        case .words:
            WordsView()
                .navigationBarBackButtonHidden()
        case .vocabularyLevel:
            VocabularyLevelView()
                .navigationBarBackButtonHidden()
        case .theme:
            ThemeView()
                .navigationBarBackButtonHidden()
        case .voice:
            VoiceView()
                .navigationBarBackButtonHidden()
        case .customize:
            CustomizeView()
                .navigationBarBackButtonHidden()
        case .goal:
            GoalView()
                .navigationBarBackButtonHidden()
        case .topic:
            TopicView()
                .navigationBarBackButtonHidden()
        case .home:
            HomeView()
                .navigationBarBackButtonHidden()
        case .flashcard:
            FlashcardView()
                .navigationBarBackButtonHidden()
        }
    }
    
    @ViewBuilder
    func buildSheet(sheet: Sheet) -> some View {
        switch sheet {
        case .placeHolder:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func buildCover(cover: FullScreenCover) -> some View {
        switch cover {
        case .placeHolder:
            EmptyView()
        }
    }
}
