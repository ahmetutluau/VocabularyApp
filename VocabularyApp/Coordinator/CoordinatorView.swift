//
//  CoordinatorView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 8.05.2025.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
        
    var page: AppPages {
        guard let hasLaunchedBefore = UserDefaultManager.shared.hasLaunchedBefore else { return .onboardingStart}
        if hasLaunchedBefore {
            return .home
        } else {
            return .onboardingStart
        }
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: page)
                .navigationDestination(for: AppPages.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.buildSheet(sheet: sheet)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { item in
                    coordinator.buildCover(cover: item)
                }
        }
        .environmentObject(coordinator)
    }
}


