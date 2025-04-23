//
//  HomeView.swift
//  HarubitV3
//
//  Created by ellllly on 4/22/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var currentIndex = 0
    
    let card = GratitudeCard(
        year: "2024",
        items: [
            "A cozy Sunday morning",
            "Chatting with my best friend",
            "Sunny and warm weatherdddddddddddddddddddddddddddddddddddddddddddddddddd"
        ]
    )
    
    
    
    var body: some View {
//        @State var card : String = "ok"
        ZStack{
            Image("RectangleImage")
                .resizable()
                .scaledToFill() // 이미지 스케일 꽉차게 해줌
                .ignoresSafeArea()
           
            VStack {
                
                Spacer()
                Text("Harubit")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
            
                TabView(selection: $currentIndex) {
                    ForEach(0..<3) { i in
                        ZStack {
                            GratitudeCardView(card: card)
                      
        
                            
                        }
                        
                        
                        Text("Page \(i + 1)")
                            .frame(maxWidth: 280, maxHeight: 400)
                            .background(Color.blue.opacity(0.2), in : RoundedRectangle(cornerRadius: 50))
                            .tag(i)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // 인디케이터 숨기기
                .frame(height: 500)

                // 👉 커스텀 인디케이터
                HStack(spacing: 8) {
                    ForEach(0..<3) { i in
                        RoundedRectangle(cornerRadius: 4)
                            .fill(i == currentIndex ? .white : .gray)
                            .frame(width: i == currentIndex ? 20 : 8, height: 8)
                            .animation(.easeInOut, value: currentIndex)
                    }
                }
                .padding(.top, 10)
                
//                Button("Weekly Gratitude") {
//                    
//                }
            }
        }
    }
}

#Preview {
    HomeView()
}
