//
//  RecordView.swift
//  Harubit
//
//  Created by ellllly on 4/19/25.
//

import SwiftUI
import SwiftData

struct RecordView: View {
    @StateObject var recordManger = RecordManager()
    @Query private var harubitNote: [HarubitNote]
    
    @State private var currentIndex: Int = 0
    let pages = ["2023", "2024", "2025"]
    
//    var indicatorColors: [Color] = [.pink, .mint, .orange]
//    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Text("오늘의 감사일기")
                    .frame(maxWidth: .infinity,alignment: .center)
                    .padding(.top, 100)
                    .foregroundColor(.white)
                    .font(.title2)
                
                Text("\(recordManger.getFormattedDate(form: "MM"))월 \(recordManger.getFormattedDate(form: "dd"))일")
                    .padding(.top, 10)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                
                VStack{
                    GeometryReader { geo in
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(pages.indices, id: \.self) { i in
                                    Text(harubitNote[0].content)//"일기내용")
                                        .frame(width: 350, height: 500)
                                        .background(Color.white.opacity(0.3))
                                        .foregroundColor(.white)
                                        .cornerRadius(8) // 일기 내용이 드렁가면 되양
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .environment(\.layoutDirection, .rightToLeft)
                        .gesture(
                            DragGesture().onEnded { value in
                                                    let threshold: CGFloat = 50
                                                    if value.translation.width < -threshold {
                                                        currentIndex = min(currentIndex + 1, pages.count - 1)
                                                    } else if value.translation.width > threshold {
                                                        currentIndex = max(currentIndex - 1, 0)
                                                    }
                                                }
                        )
                        
                    }
                    
                    HStack{
                        ForEach(pages.indices, id: \.self) {i in
                            ZStack{
                                Rectangle()
                                    .fill(currentIndex == i ? Color.accentColor :  Color.white.opacity(0.3))
                                    .frame(width: 80, height: 30)
                                    .cornerRadius(10)
                                    .animation(.easeInOut, value: currentIndex)
                                Text(pages[i])
                            }
                        }
                    }
                }

                
        
                
//                        .fill(Color).gray)
                    
                    
                
                Spacer()
                
                
            }
            

        }
        
    }
}

#Preview {
    RecordView()
        .modelContainer(for: HarubitNote.self, inMemory: true)
}
