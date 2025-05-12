//
//  CardBackView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 12.05.2025.
//

import SwiftUI

struct CardBackView: View {
    @Binding var degree: Double
    var textContext: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 1)
                .fill(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textBackground ?? "gray"))
                .shadow(color: .gray, radius: 2, x: 0, y: 1)
            
            VStack {
                HStack {
                    Text("BACK")
                        .padding(10)
                        .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                        .clipShape(.capsule)
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                Text(textContext.capitalized)
                    .font(.title2)
                    .lineLimit(10)
                    .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                    .multilineTextAlignment(.center)
                    .padding()
                    
                Spacer()
                
                Text("Tap to flip card")
                    .font(.subheadline)
                    .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary").opacity(0.5))
                    .padding()
            }
        }
        .padding(24)
        .rotation3DEffect(
            Angle(degrees: degree),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )

    }
}

struct CardBackView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardBackView(degree: .constant(0.0), textContext: "word string goes here")
                .preferredColorScheme(.light)
            
            CardBackView(degree: .constant(0.0), textContext: "word string goes here")
                .preferredColorScheme(.dark)
        }
    }
}
