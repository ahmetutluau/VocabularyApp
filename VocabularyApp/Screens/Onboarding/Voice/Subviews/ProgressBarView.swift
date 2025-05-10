//
//  ProgressBarView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 10.05.2025.
//

import SwiftUI

struct ProgressBarView: View {
    let progress: CGFloat
    let totalBars: Int

    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<totalBars, id: \.self) { index in
                let barProgress = CGFloat(index) / CGFloat(totalBars)
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 2, height: CGFloat.random(in: 10...30))
                    .foregroundColor(progress > barProgress ? .primary : .secondary)
            }
        }
        .animation(.linear(duration: 0.05), value: progress)
    }
}
