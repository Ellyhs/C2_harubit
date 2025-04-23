//
//  WeeklyListView.swift
//  HarubitV3
//
//  Created by ellllly on 4/22/25.
//

import SwiftUI

struct WeeklyListView: View {
    
    let cards: [GratitudeCard] = [
            GratitudeCard(year: "2023", items: ["Korean BBQ dinner", "Kind gesture from a stranger", "Relaxing evening walk"]),
            GratitudeCard(year: "2024", items: ["A cozy Sunday morning", "Chatting with my best friend", "Sunny and warm weather"]),
            GratitudeCard(year: "2025", items: ["An inspiring podcast episode", "Making progress on a project", "The beautiful sunset"])
        ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            
            
            // 상단 부분: GratitudeCardView 영역
            cardSection
                .frame(height: UIScreen.main.bounds.height * 0.5) // 화면의 정확히 절반
            
            // 하단 부분: 오로라 이미지 영역
            auroraSection
                .frame(height: UIScreen.main.bounds.height * 0.5) // 화면의 정확히 절반
        }
    }
    
    var cardSection: some View {
            ZStack {
                // 상단 배경 (불투명)
                Color.black.opacity(0.7)
                
                VStack {
                    Text("Harubit")
                        .font(.system(size: 40, weight: .regular, design: .serif))
                        .foregroundColor(Color(red: 0.98, green: 0.96, blue: 0.85))
                        .padding(.top, 40)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 28) {
                            ForEach(cards) { card in
                                GratitudeCardView(card: card)
                            }
                        }
                        .padding(.horizontal, 18)
                    }
                    
                    Spacer()
                }
            }
        }
        
        // 오로라 섹션
        var auroraSection: some View {
            ZStack(alignment: .bottom) {
                // 오로라 이미지
                Image("aurora")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                
                // 버튼 영역
                Button(action: {
                    // 버튼 액션
                }) {
                    Text("Weekly Gratitude")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(Color(red: 0.80, green: 0.73, blue: 0.41))
                        .padding(.horizontal, 44)
                        .padding(.vertical, 18)
                        .background(
                            Capsule()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color(red: 1.0, green: 0.99, blue: 0.92, opacity: 0.95),
                                            Color(red: 1.0, green: 0.98, blue: 0.85, opacity: 0.85)
                                        ]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .shadow(color: Color.yellow.opacity(0.55), radius: 24, x: 0, y: 0)
                        )
                }
                .padding(.bottom, 40)
            }
        }
}

#Preview {
    WeeklyListView()
}
