//
//  FlashcardView.swift
//  VocabularyApp
//
//  Created by Ahmet Utlu on 12.05.2025.
//

import SwiftUI

struct FlashcardView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var viewModel = FlashcardViewModel()

    var body: some View {
        ZStack {
            Image(UserDefaultManager.shared.selectedTheme?.image ?? "theme1")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack(content: {
                    Button(action: {
                        coordinator.pop()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                    })
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            viewModel.shuffleFlashCards()
                            viewModel.isAlertPresented = true
                            
                            viewModel.alertMessage = "Flashcards shuffled"

                            // Automatically dismiss the alert after 2 seconds
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                viewModel.isAlertPresented = false
                            }
                        }, label: {
                            Image(systemName: "shuffle")
                                .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))

                        })//: Suffle buttton
                    }//: HStack
                })//: navbar
                .padding()
                
                // Progress bar at the top
                ProgressView(value: Double(viewModel.flashCardIndex + 1), total: Double(max(viewModel.flashCards.count, 1)))
                    .progressViewStyle(LinearProgressViewStyle())
                    .tint(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                    .padding(.horizontal)
                
                ZStack {
                    if !viewModel.flashCards.isEmpty {
                        CardFrontView(degree: $viewModel.frontDegree,
                                      textContext: viewModel.flashCards[viewModel.flashCardIndex].title)
                        
                        CardBackView(degree: $viewModel.backDegree,
                                     textContext: viewModel.flashCards[viewModel.flashCardIndex].description)
                    }
                }
                .onTapGesture {
                    viewModel.flipCard()
                }
                .padding(24)
                .overlay(alignment: .bottom, content: {
                    // Custom Alert Message
                    if viewModel.isAlertPresented {
                        Text(viewModel.alertMessage)
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.blue.opacity(0.5))
                            .cornerRadius(10)
                            .transition(.opacity)
                            .animation(.easeInOut, value: viewModel.isAlertPresented)
                            .padding()
                    }
                })
                            
                HStack {
                    if viewModel.flashCardIndex > 0 {
                        Button(action: {
                            viewModel.resetCardToFront()
                            viewModel.flashCardIndex -= 1
                        }, label: {
                            Text("< Previous")
                                .font(.body)
                                .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                        })
                    } else {
                        Text("< Previous")
                            .font(.body)
                            .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary").opacity(0.5))
                    }
                    
                    Spacer()
                    
                    if viewModel.flashCardIndex < (viewModel.flashCards.count - 1) {
                        Button(action: {
                            viewModel.resetCardToFront()
                            viewModel.flashCardIndex += 1
                        }, label: {
                            Text("Next >")
                                .font(.body)
                                .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary"))
                        })
                    } else {
                        Text("Next >")
                            .font(.body)
                            .foregroundColor(Color.stringToColor(colorString: UserDefaultManager.shared.selectedTheme?.textColor ?? "primary").opacity(0.5))
                    }
                }//: hstack
                .padding(.horizontal, 48)
                .padding(.bottom, 32)
            }
        }
        .onAppear {
            viewModel.shuffleFlashCards()
        }
    }
}

struct FlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FlashcardView()
                .environmentObject(Coordinator())
                .preferredColorScheme(.light)
            
            FlashcardView()
                .environmentObject(Coordinator())
                .preferredColorScheme(.dark)
        }
    }
}

